import 'package:e_commerce_app/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/search_text_field.dart';
import 'best_selling_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                const CustomHomeAppBar(),
                const SizedBox(height: 16),
                const SearchTextField(),
                const SizedBox(height: 12),
                FeaturedList(),
                const SizedBox(height: 12),
                const BestSellingHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const BestSellingGridView(),
        ],
      ),
    );
  }
}
