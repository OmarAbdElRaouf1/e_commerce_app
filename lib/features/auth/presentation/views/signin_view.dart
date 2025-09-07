import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart' show AuthRepo;
import 'package:e_commerce_app/features/auth/presentation/manager/cubits/signin_cubits/cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/getit_service.dart';
import 'widgets/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          automaticallyImplyLeading: false,
          context: context,
          title: 'تسجيل دخول',
        ),
        body: SafeArea(child: SigninViewBodyBlocConsumer()),
      ),
    );
  }
}
