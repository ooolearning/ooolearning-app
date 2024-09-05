import 'package:flutter/material.dart';

class LayoutWrapper extends StatelessWidget {
  const LayoutWrapper({
    super.key,
    required this.desktop,
    required this.mobile,
  });

  final Widget desktop;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 800) {
      return mobile;
    }

    return desktop;
  }
}
