import 'package:api_session_practice/shared/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.7,right: 24.7, top: 16.0),
      child: TextField(
        decoration: InputDecoration(
          // focusColor: AppColors.primary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 1.0,
              style: BorderStyle.solid,
              strokeAlign: 5,
            ),
          ),
          hintText: 'Search for products',
          prefixIcon: Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.0,
              // style: BorderStyle.solid,
              strokeAlign: 0,
            ),
          ),
          filled: true,
          fillColor: AppColors.secondaryLight,
        ),
      ),
    );
  }
}
