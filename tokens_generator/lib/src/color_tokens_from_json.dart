import 'dart:convert';
import 'dart:io';

import 'package:tokens_generator/src/utils.dart';

class Color {
  final double r;
  final double g;
  final double b;
  final double a;

  Color(this.r, this.g, this.b, this.a);

  @override
  String toString() {
    return 'const Color.fromARGB(${(a * 255).toInt()}, ${(r * 255).toInt()}, ${(g * 255).toInt()}, ${(b * 255).toInt()})';
  }
}

class ThemeColor {
  final String name;
  final Map<String, Color> colors;

  ThemeColor(this.name, this.colors);

  @override
  String toString() {
    return '''
  static const Map<String, Color> ${name.replaceAll(" ", "_").toLowerCase()} = {
${colors.entries.map((entry) => '    "${entry.key}": ${entry.value},').join('\n')}
  };
''';
  }
}

List<ThemeColor> createThemeColorsFromJson(String pathToJsonFile) {
  final file = File(pathToJsonFile);
  if (!file.existsSync()) {
    print('File not found');
    return [];
  }
  final jsonStr = file.readAsStringSync();
  final jsonData = json.decode(jsonStr);

  final themeModes = jsonData['modes'] as Map<String, dynamic>;
  final variableIds =
      (jsonData['variableIds'] as List).map((e) => e as String).toList();
  final variables = (jsonData['variables'] as List)
      .map((e) => e as Map<String, dynamic>)
      .toList();

  Color? getResolvedColor(
      Map<String, dynamic> variable, String mode, List<String> variableIds) {
    final resolvedValuesByMode =
        variable['resolvedValuesByMode'] as Map<String, dynamic>;

    if (resolvedValuesByMode.containsKey(mode)) {
      late final Map<String, dynamic> resolvedValue;
      try {
        resolvedValue =
            resolvedValuesByMode[mode]['resolvedValue'] as Map<String, dynamic>;
      } catch (e) {
        print(
            'Resolved value not found in variable: ${variable['name']} - value $variable');
        rethrow;
      }

      late final String? alias;
      // try {
      alias = resolvedValuesByMode[mode]['alias'] as String?;
      // } catch (e) {
      //   print('Alias not found in variable: ${variable['name']} - mode $mode');
      //   rethrow;
      // }
      if (alias != null && variableIds.contains(alias)) {
        final aliasVariable = variableIds
            .map((id) =>
                variables.firstWhere((v) => v['id'] == id, orElse: () => {}))
            .firstWhere((v) => v['id'] == alias, orElse: () => {});

        if (aliasVariable.isEmpty) {
          return null;
        }

        return getResolvedColor(aliasVariable, mode, variableIds);
      }

      return Color(
        (resolvedValue['r'] as num).toDouble(),
        (resolvedValue['g'] as num).toDouble(),
        (resolvedValue['b'] as num).toDouble(),
        (resolvedValue['a'] as num).toDouble(),
      );
    }

    return null;
  }

  String getVariableName(String rawName) {
    var name = kebabToCamel(rawName.split('/').last);
    if (rawName.startsWith('Tag/')) {
      final colorName = capitalizeFirstCharacter(
          removeSpacesAndConvertToCapitalized(rawName.split('/')[1]));
      name = capitalizeFirstCharacter(name);
      name = 'tag$colorName$name';
    } else if (rawName.startsWith('Gantt Chart Library/')) {
      final colorName = capitalizeFirstCharacter(
          removeSpacesAndConvertToCapitalized(rawName.split('/')[1]));
      name = capitalizeFirstCharacter(name);
      name = 'ganttChartLibrary$colorName$name';
    }
    return name;
  }

  final themeColors = <ThemeColor>[];

  themeModes.forEach((key, value) {
    final themeName = value as String;
    final themeColorMap = <String, Color>{};

    for (final variableId in variableIds) {
      final variable =
          variables.firstWhere((v) => v['id'] == variableId, orElse: () => {});

      if (variable.isEmpty) {
        continue;
      }

      if (variable['type'] != 'COLOR') {
        continue;
      }

      final color = getResolvedColor(variable, key, variableIds);

      if (color != null) {
        final variableName = getVariableName(variable['name'] as String);
        themeColorMap[variableName] = color;
      }
    }

    themeColors.add(ThemeColor(themeName, themeColorMap));
  });

  // Print Dart code for theme colors
  // for (final themeColor in themeColors) {
  //   print(themeColor);
  // }

  return themeColors;
}

String createThemeInterfaceFromThemeColor(ThemeColor themeColor) {
  final themeColorMap = themeColor.colors;

  final themeInterface = '''
// ignore_for_file: public_member_api_docs

import 'dart:ui';

abstract class CDSThemeColors {
${themeColorMap.entries.map((entry) => '  Color get ${entry.key};').join('\n')}
}
''';

  // print(themeInterface);
  return themeInterface;
}

String createThemeClassThatImplementsThemeInterface(ThemeColor themeColor) {
  final themeColorMap = themeColor.colors;

  final themeClass = '''
// ignore_for_file: public_member_api_docs

import 'dart:ui';
import 'package:carbon_design_system/colors/theme_colors.dart';

class ${themeColor.name.replaceAll(" ", "")}Colors implements CDSThemeColors {
  const ${themeColor.name.replaceAll(" ", "")}Colors();

${themeColorMap.entries.map((entry) => '  @override\n  Color get ${entry.key} => ${entry.value};').join('\n')}
}
''';

  // print(themeClass);

  return themeClass;
}

void generateThemes(String themeJsonPath) {
  final themeColors = createThemeColorsFromJson(themeJsonPath);

  if (themeColors.isEmpty) {
    print('No theme colors found');
    return;
  }

  final interfaceFile = File('output/theme_colors.dart');
  interfaceFile
      .writeAsStringSync(createThemeInterfaceFromThemeColor(themeColors.first));

  for (final themeColor in themeColors) {
    final words = themeColor.name.replaceAll(" ", "_").toLowerCase().split("_");
    words.removeLast();
    final themeFile = File('output/theme_colors_${words.join("_")}.dart');
    final result = createThemeClassThatImplementsThemeInterface(themeColor);
    themeFile.writeAsStringSync(result);
  }
}
