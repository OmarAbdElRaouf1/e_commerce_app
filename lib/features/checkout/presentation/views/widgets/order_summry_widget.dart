import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              'المجموع الفرعي ',
              style: AppTextStyles.normal14.copyWith(
                color: const Color(0xFF4E5556),
              ),
            ),
            Spacer(),
            Text(
              '1000 جنيه',
              style: AppTextStyles.normal14.copyWith(color: const Color(0xFF0C0D0D)),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              'التوصيل  :',
              style: AppTextStyles.normal14.copyWith(color: const Color(0xFF4E5556)),
            ),
            Spacer(),
            Text(
              '40 جنيه',
              style: AppTextStyles.normal14.copyWith(
                color: const Color(0xFF4E5556),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Divider(
          thickness: 0.5,
        ),
        SizedBox(
          height: 9,
        ),
        Row(
          children: [
            Text(
              'الكلي',
              style: AppTextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
            ),
            Spacer(),
            Text(
              '1040 جنيه',
              style: AppTextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
