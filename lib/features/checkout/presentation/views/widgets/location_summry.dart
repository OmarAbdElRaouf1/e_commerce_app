import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entities/order_entity.dart';
import 'location_widget.dart';

class LocationSummry extends StatelessWidget {
  const LocationSummry({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LocationWidget(
          title: 'عنوان التوصيل',
          child: Row(
            children: [
              SvgPicture.asset(Assets.imagesLocation),
              SizedBox(width: 8),
              Text(
                context.read<OrderEntity>().shippingAddressEntity.toString(),
                style: AppTextStyles.normal14.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              Spacer(),
              InkWell(
                  onTap: () {
                    pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: SvgPicture.asset(Assets.imagesEdit)),
              SizedBox(width: 4),
              InkWell(
                onTap: () {
                  pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text('تعديل', style: AppTextStyles.normal14),
              ),
            ],
          )),
    );
  }
}
