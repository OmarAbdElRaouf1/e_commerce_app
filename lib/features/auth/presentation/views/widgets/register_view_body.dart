import 'package:e_commerce_app/core/widgets/custom_appBar.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'terms_and_conditions.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                CustomAppBar(context: context, title: 'حساب جديد'),
                const SizedBox(height: 20),
                CustomTextFormField(
                  hintText: ' الاسم كامل',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  Icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                  hintText: 'كلمة المرور',
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 30),
                TermsAndConditions(),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'انشاء حساب',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const HaveAnAccount(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
