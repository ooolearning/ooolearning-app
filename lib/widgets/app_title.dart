import 'package:flutter/material.dart';
import 'package:ooolearning_app/utils/constants.dart';
import 'package:ooolearning_app/utils/assets.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Image.asset(ImageAssets.oooLearning),
        ),
        const SizedBox(width: 8),
        const Text(Constants.appName),
      ],
    );
  }
}
