import 'package:e_commerce_app/core/services/getit_service.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart' show AuthRepo;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubits/signup_cubits/signup_cubit.dart';
import 'widgets/signup_view_body_bloc_consumer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: SafeArea(child: Builder(builder: (context) {
          return SignupViewBlocConsumer();
        })),
      ),
    );
  }
}
