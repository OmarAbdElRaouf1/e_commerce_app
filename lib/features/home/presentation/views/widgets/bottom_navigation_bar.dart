import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../../core/utils/app_colors.dart';

class BNavigationBar extends StatelessWidget {
  const BNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: 10,
          ),
          child: GNav(
            activeColor: AppColors.primary,
            rippleColor: Colors.grey[300]!,
            color: Colors.black,
            gap: 8,
            padding: const EdgeInsets.all(
              16,
            ),
            tabs: [
              GButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/HomeView');
                },
                icon: Remix.home_3_fill,
                text: 'الرئيسيه',
              ),
              GButton(
                onPressed: () {},
                icon: LucideIcons.layoutGrid,
                text: 'المنتجات',
              ),
              GButton(
                onPressed: () {},
                icon: Remix.shopping_cart_2_fill,
                text: 'سله التسوق',
              ),
              GButton(
                onPressed: () {},
                icon: Remix.user_3_fill,
                text: 'حسابي',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
