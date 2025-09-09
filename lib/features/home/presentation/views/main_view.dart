import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/views/Pages/home_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/Pages/products_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/Pages/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

import 'Pages/cart_view.dart';
import 'widgets/main_view_body_bloc_consumer.dart';

class MainView extends StatefulWidget {
  static const String routeName = 'MainView';
  const MainView({super.key});
  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  void navigateToTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomeView(),
    ProductsView(),
    CartView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MainViewBodyBlocConsumer(
            selectedIndex: _selectedIndex, pages: _pages),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.005,
              vertical: MediaQuery.of(context).size.height * 0.001,
            ),
            child: GNav(
              tabBackgroundGradient: LinearGradient(
                colors: [
                  Color(0xFFDADADA),
                  Color(0xFFDADADB),
                ],
              ),
              activeColor: AppColors.primary,
              rippleColor: Colors.grey[300]!,
              color: Colors.black,
              gap: 8,
              padding: const EdgeInsets.all(
                16,
              ),
              tabs: [
                GButton(
                  activeBorder: Border.all(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  icon: Iconsax.home,
                  style: GnavStyle.google,
                  iconActiveColor: AppColors.primary,
                  text: "الرئيسية",
                ),
                GButton(
                  icon: Iconsax.category,
                  style: GnavStyle.google,
                  iconActiveColor: AppColors.primary,
                  text: "المنتجات",
                ),
                GButton(
                  icon: Iconsax.shopping_cart4,
                  style: GnavStyle.google,
                  iconActiveColor: AppColors.primary,
                  text: "سلة التسوق",
                ),
                GButton(
                  icon: Iconsax.user,
                  style: GnavStyle.google,
                  iconActiveColor: AppColors.primary,
                  text: "حسابي",
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
