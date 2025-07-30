import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import '../../../../../core/utils/app_text_styles.dart';
import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                right: itemWidth * .35,
                child: Image.asset(
                  Assets.imagesTest,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.imagesShape),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 33,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Text('عروض العيد',
                          style: AppTextStyles.normal14.copyWith(
                            color: Colors.white,
                          )),
                      const SizedBox(height: 4),
                      Text(
                        'خصم 25%',
                        style: AppTextStyles.bold19.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      FeaturedItemButton(
                        onPressed: () {},
                      ),
                      const SizedBox(height: 29),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
