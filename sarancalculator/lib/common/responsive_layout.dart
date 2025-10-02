import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget ultrahd;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.ultrahd,
  });

  static const int mobileMaxWidth = 600;
  static const int tabletMaxWidth = 1024;
  static const int desktopMaxWidth = 1920;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= mobileMaxWidth) {
          return mobile;
        } else if (constraints.maxWidth <= tabletMaxWidth) {
          return tablet;
        } else if (constraints.maxWidth <= desktopMaxWidth) {
          return desktop;
        } else {
          return ultrahd;
        }
      },
    );
  }
}
