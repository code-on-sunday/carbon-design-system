// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// `CDSTextStyles` is an extension on `BuildContext` that provides a set of predefined text styles.
/// These styles are designed to provide consistent typography across your application.
///
/// Each getter returns a `TextStyle` object with predefined properties.
///
/// More about these styles can be found in the [CDS Design System](https://carbondesignsystem.com/elements/typography/type-sets).
///
/// TO-DO: Add Fluid Heading Styles and Fluid Display Styles
extension CDSTextStyles on BuildContext {
  TextStyle get code01 => const TextStyle(
        fontFamily: 'IBM Plex Mono',
        fontSize: 12,
        height: 16.0 / 12.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.32,
      );

  TextStyle get code02 => const TextStyle(
        fontFamily: 'IBM Plex Mono',
        fontSize: 14,
        height: 20.0 / 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.32,
      );

  TextStyle get label01 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 12,
        height: 16.0 / 12.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.32,
      );

  TextStyle get label02 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 14,
        height: 18.0 / 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.16,
      );

  TextStyle get helperText01 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 12,
        height: 16.0 / 12.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.32,
      );

  TextStyle get helperText02 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 14,
        height: 18.0 / 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.16,
      );

  TextStyle get legal01 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 12,
        height: 16.0 / 12.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.32,
      );

  TextStyle get legal02 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 14,
        height: 18.0 / 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.16,
      );

  TextStyle get bodyCompact01 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 14,
        height: 18.0 / 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.16,
      );

  TextStyle get bodyCompact02 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 16,
        height: 22.0 / 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  TextStyle get body01 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 14,
        height: 20.0 / 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.16,
      );

  TextStyle get body02 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 16,
        height: 24.0 / 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  TextStyle get headingCompact01 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 14,
        height: 18.0 / 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.16,
      );

  TextStyle get headingCompact02 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 16,
        height: 22.0 / 16.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  TextStyle get heading01 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 14,
        height: 20.0 / 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.16,
      );

  TextStyle get heading02 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 16,
        height: 24.0 / 16.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  TextStyle get heading03 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 20,
        height: 28.0 / 20.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  TextStyle get heading04 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 28,
        height: 36.0 / 28.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  TextStyle get heading05 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 32,
        height: 40.0 / 32.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  TextStyle get heading06 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 42,
        height: 50.0 / 42.0,
        fontWeight: FontWeight.w300,
        letterSpacing: 0,
      );

  TextStyle get heading07 => const TextStyle(
        fontFamily: 'IBM Plex Sans',
        fontSize: 54,
        height: 64.0 / 54.0,
        fontWeight: FontWeight.w300,
        letterSpacing: 0,
      );
}
