import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required int selectedIndex,
    required List<Widget> pages,
  })  : _selectedIndex = selectedIndex,
        _pages = pages;

  final int _selectedIndex;
  final List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _selectedIndex,
      children: _pages,
    );
  }
}
