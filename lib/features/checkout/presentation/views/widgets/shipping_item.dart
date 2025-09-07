import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.isSelected,
      required this.onTap});
  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 20,
          left: 13,
          right: 28,
          bottom: 10,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: isSelected ? AppColors.primary : Colors.transparent),
              borderRadius: BorderRadius.circular(4)),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? ActiveShippingItemDot() : InActiveShippingItemDot(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.50),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  price,
                  style: AppTextStyles.normal14
                      .copyWith(color: AppColors.lightPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 1, color: const Color(0xFF949D9E)),
        ),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: const Color(0xFF1B5E37) /* Green1-500 */,
        shape: OvalBorder(
          side: BorderSide(width: 3, color: Colors.white),
        ),
      ),
    );
  }
}
