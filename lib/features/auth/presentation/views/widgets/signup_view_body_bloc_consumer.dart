import 'package:e_commerce_app/features/auth/presentation/manager/cubits/signup_cubits/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../manager/cubits/signup_cubits/signup_cubit.dart';
import 'register_view_body.dart';

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
          );
          Navigator.of(context).pop(); // Navigate back or to another screen
        }
        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: RegisterViewBody(),
        );
      },
    );
  }
}
