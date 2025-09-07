import 'package:e_commerce_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'HomeView';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const HomeViewBody()),
    );
  }
}
