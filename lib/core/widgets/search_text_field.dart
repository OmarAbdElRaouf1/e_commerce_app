import 'package:flutter/material.dart';

import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: SizedBox(
            width: 20,
            child: SizedBox(
              width: 20,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.filter_list),
                  color: const Color(0xFFB0B3B3), // gray-400
                  onPressed: () {},
                ),
              ),
            ),
          ),
          prefixIcon: SizedBox(width: 20, child: Center(child: Image.asset(Assets.imagesSearchNormal))), // search()
          hintText: 'ابحث عن ... ',
          hintStyle: AppTextStyles.regular14.copyWith(
            color: const Color(0xFFB0B3B3), // gray-400
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xFFE6E9E9), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xFFE6E9E9), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xFFE6E9E9), width: 1),
          ),
        ),
      ),
    );
  }
}
