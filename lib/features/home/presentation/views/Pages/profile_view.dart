import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = 'Profile';
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: const ProfileViewBody(),
    ));
  }
}
