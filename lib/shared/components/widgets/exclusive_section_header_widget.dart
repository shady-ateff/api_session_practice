import 'package:api_session_practice/shared/core/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  const SectionHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              // color: AppColors.primary,
            ),
          ),
        ),
        Spacer(),
        Text.rich(
          TextSpan(
            text: "See all",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: AppColors.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('See all tapped');
              },
          ),
        ),
        SizedBox(width: 26), // Add some space between text and icon
      ],
    );
  }
}
