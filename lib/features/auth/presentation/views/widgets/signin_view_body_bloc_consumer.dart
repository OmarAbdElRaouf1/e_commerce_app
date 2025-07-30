import 'package:e_commerce_app/features/auth/presentation/manager/cubits/signin_cubits/cubit/signin_cubit.dart' show SigninCubit, SigninState, SigninLoading, SigninSuccess, SigninFailure;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../home/presentation/views/home_view.dart';
import 'signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم تسجيل الدخول بنجاح')),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
          // Navigate back or to another screen
        }
        if (state is SigninFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(),
          inAsyncCall: state is SigninLoading ? true : false,
          child: SignInViewBody(),
        );
      },
    );
  }
}
