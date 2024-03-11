# Carbon Design System

This package provides a set of predefined styles and colors based on the Carbon Design System for Flutter applications. It includes a variety of theme colors and typography styles that you can use to ensure consistent design across your application.

## Features

- Predefined theme colors including grays and white.
- A set of predefined text styles based on the Carbon Design System.

## Getting started

To start using this package, add `carbon_design_system` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  carbon_design_system: ^0.0.1
```

Then, run `flutter pub get` in your terminal.

## Usage

Import the package in your Dart file to use the colors and text styles.

```dart
import 'package:carbon_design_system/carbon_design_system.dart';
```

Wrap your widget tree inside the `CDSThemeColorsProvider`.

```dart
CDSThemeColorsProvider(
    themeColors: WhiteThemeColors(),
    child: YourWidgetTree(),
)
```

You can then access the colors and text styles from any descendant widget using a `BuildContext` instance.

```dart
TextStyle textStyle = context.label01;
Color color = context.colors.background;
```

## Contributing

Contributions are welcome! If you find a bug or want to contribute to the code, please create an issue or submit a pull request.

## License

This project is licensed under the MIT License.
