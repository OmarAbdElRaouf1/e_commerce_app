import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    const double itemWidth = 320;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: SizedBox(
        width: itemWidth,
        child: const AspectRatio(
          aspectRatio: 342 / 158,
          child: _FeaturedItemContent(itemWidth: itemWidth),
        ),
      ),
    );
  }
}

class _FeaturedItemContent extends StatelessWidget {
  const _FeaturedItemContent({required this.itemWidth});

  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned(
          left: 0,
          bottom: 0,
          top: 0,
          right: itemWidth * 0.35,
          child: Image.asset(
            Assets.imagesTest,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Icon(Icons.error),
              );
            },
          ),
        ),

        // Foreground content with SVG background
        SizedBox(
          width: itemWidth * 0.5,
          child: Stack(
            children: [
              // SVG Shape as background
              Positioned.fill(
                child: SvgPicture.asset(
                  Assets.imagesShape,
                  fit: BoxFit.fill,
                  placeholderBuilder: (context) => Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.deepOrange
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.only(right: 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      'عروض العيد',
                      style: AppTextStyles.normal14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'خصم 25%',
                      style: AppTextStyles.bold19.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    SizedBox(
                      width: 120,
                      child: FeaturedItemButton(
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 29),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
