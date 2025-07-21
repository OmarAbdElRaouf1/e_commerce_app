import 'package:e_commerce_app/features/auth/presentation/manager/cubits/signup_cubits/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/signup_cubits/signup_cubit.dart';
import 'register_view_body.dart';

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RegisterViewBody();
      },
    );
  }
}
