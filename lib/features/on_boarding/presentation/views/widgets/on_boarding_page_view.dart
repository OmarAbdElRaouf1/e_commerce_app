import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/widgets/page_view-item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      children: [
        PageViewItem(
          isVisiable: true,
          image: Assets.imagesPageviewimage2,
          backgroundImage: Assets.imagesPageviewimage1,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك في',
                style: AppTextStyles.bold23,
              ),
              Text(
                ' HUB',
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.secondary,
                  fontFamily: 'Cairo',
                ),
              ),
              Text(
                'Fruit',
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        PageViewItem(
          isVisiable: false,
          image: Assets.imagesPageviewimage4,
          backgroundImage: Assets.imagesPageviewimage3,
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ابحث وتسوق',
                textAlign: TextAlign.center,
                style: AppTextStyles.bold23,
              ),
            ],
          ),
        ),
        // Add more OnBoardingViewBody widgets here for additional pages
      ],
    );
  }
}
