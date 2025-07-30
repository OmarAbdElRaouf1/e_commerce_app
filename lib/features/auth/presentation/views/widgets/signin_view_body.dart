import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/password_field.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/cubits/signin_cubits/cubit/signin_cubit.dart' show SigninCubit;
import 'package:e_commerce_app/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'الايميل الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) => password = value!,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ForgetPasswordButton()
                ],
              ),
              SizedBox(
                height: 24,
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // Handle sign-in logic here
                      context.read<SigninCubit>().signInWithEmailAndPassword(email, password);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'تسجيل الدخول'),
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
                image: Assets.imagesGoogle,
                label: 'تسجيل بواسطه جوجل',
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
              ),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                image: Assets.imagesFacebook,
                label: 'تسجيل بواسطه فيسبوك',
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
