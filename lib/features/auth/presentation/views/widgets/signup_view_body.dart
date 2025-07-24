import 'package:e_commerce_app/core/widgets/custom_appBar.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/cubits/signup_cubits/signup_cubit.dart' show SignupCubit;
import 'package:e_commerce_app/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/password_field.dart';
import 'terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late String email, password, name;
  late bool isTermsAccepted = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              CustomAppBar(context: context, title: 'حساب جديد'),
              const SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (value) => name = value!,
                hintText: ' الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              PasswordField(
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 30),
              TermsAndConditions(
                onChanged: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: 'انشاء حساب',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context.read<SignupCubit>().createUserWithEmailAndPassword(
                            email,
                            password,
                            name,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('يجب قبول الشروط والأحكام'),
                        ),
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
