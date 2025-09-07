import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required int selectedIndex,
    required List<Widget> pages,
  })  : _selectedIndex = selectedIndex,
        _pages = pages;

  final int _selectedIndex;
  final List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartItemAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 250),
                content: Text('تم إضافة العنصر بنجاح'),
              ),
            );
          }
          if (state is CartItemRemoved) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 250),
                content: Text('تم إزالة العنصر بنجاح'),
              ),
            );
          }
        },
        child: MainViewBody(selectedIndex: _selectedIndex, pages: _pages));
  }
}
