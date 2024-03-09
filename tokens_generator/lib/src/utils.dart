String kebabToCamel(String kebabCase) {
  try {
    List<String> parts =
        kebabCase.split('-').where((e) => e.isNotEmpty).toList();

    if (parts.length > 1) {
      for (int i = 1; i < parts.length; i++) {
        parts[i] = removeSpacesAndConvertToCapitalized(parts[i]);
        parts[i] = capitalizeFirstCharacter(parts[i]);
      }
    }

    parts[0] = removeSpacesAndConvertToCapitalized(parts[0]);

    return parts.join('');
  } catch (e) {
    print('Error in kebabToCamel: $kebabCase');
    rethrow;
  }
}

String removeSpacesAndConvertToCapitalized(String input) {
  try {
    List<String> parts = input.split(' ').where((e) => e.isNotEmpty).toList();

    if (parts.length > 1) {
      for (int i = 1; i < parts.length; i++) {
        parts[i] =
            parts[i][0].toUpperCase() + parts[i].substring(1).toLowerCase();
      }
    }

    parts[0] = parts[0].toLowerCase();

    return parts.join('');
  } catch (e) {
    print('Error in removeSpacesAndConvertToCapitalized: $input');
    rethrow;
  }
}

String capitalizeFirstCharacter(String input) {
  return input[0].toUpperCase() + input.substring(1);
}
