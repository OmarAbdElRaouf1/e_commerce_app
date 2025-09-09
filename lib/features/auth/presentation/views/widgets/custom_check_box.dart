import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
        // Trigger a rebuild to reflect the change in the checkbox state
        (context as Element).markNeedsBuild();
      },
      child: AnimatedContainer(
        clipBehavior: Clip.antiAlias,
        duration: const Duration(milliseconds: 100),
        width: 20,
        height: 20,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isChecked ? AppColors.primary : const Color(0xFFDCDEDE),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          color: isChecked ? AppColors.primary : Colors.white,
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(1),
                child: SvgPicture.asset(
                  Assets.imagesCheck,
                  color: isChecked ? Colors.white : Colors.transparent,
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
