import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/setup_service_locator.dart';
import '../../data/repositories/login_repo_impl.dart';
import '../../domain/use_cases/google_login_usecase.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../widgets/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        loginUseCase: LoginUseCase(
          loginRepo: getIt.get<LoginRepoImpl>(),
        ),
        googleLoginUseCase:
            GoogleLoginUseCase(loginRepo: getIt.get<LoginRepoImpl>()),
      ),
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
