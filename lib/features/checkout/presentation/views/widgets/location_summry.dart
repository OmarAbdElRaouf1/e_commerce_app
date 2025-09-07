import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'location_widget.dart';

class LocationSummry extends StatelessWidget {
  const LocationSummry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LocationWidget(
        title: 'عنوان التوصيل',
        child: Row(
          children: [
            SvgPicture.asset(Assets.imagesLocation),
            SizedBox(width: 8),
            Text(
              'المنصورة , شارع 123',
              style: AppTextStyles.normal14.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
            ),
            Spacer(),
            SvgPicture.asset(Assets.imagesEdit),
            SizedBox(width: 4),
            Text('تعديل', style: AppTextStyles.normal14),
          ],
        ));
  }
}
