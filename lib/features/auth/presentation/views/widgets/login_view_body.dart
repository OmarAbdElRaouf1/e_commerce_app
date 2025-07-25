import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/password_field.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              hintText: 'الايميل الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16,
            ),
            PasswordField(),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'هل نسيت كلمة المرور؟',
                  style: AppTextStyles.bold13.copyWith(color: AppColors.lightPrimary),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            CustomButton(onPressed: () {}, text: 'تسجيل الدخول'),
            SizedBox(
              height: 30,
            ),
            DontHaveAccount(),
            SizedBox(
              height: 33,
            ),
            const OrDivider(),
            SizedBox(
              height: 25,
            ),
            SocialLoginButton(
              image: Assets.imagesFacebook,
              label: 'تسجيل بواسطه فيسبوك',
              onPressed: () {},
            ),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.imagesApple,
              label: 'تسجيل بواسطه أبل',
              onPressed: () {},
            ),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.imagesGoogle,
              label: 'تسجيل بواسطه جوجل',
              onPressed: () {},
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
