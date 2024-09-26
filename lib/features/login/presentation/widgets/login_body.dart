import 'package:animate_do/animate_do.dart';
import 'package:earth_haven/features/login/presentation/widgets/sign_with_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';
import '../../../../core/functions/login_success.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/widgets/back_icon.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../data/models/login_model.dart';
import '../manager/login_cubit/login_cubit.dart';
import 'go_to_register.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          // showFloatingTopBanner(message: 'Login Success :)', context: context);
        loginSuccess(state, context);
        }
        if (state is LoginErrorState) {
          showSnackBar(message: 'Login Failed :(', context: context);
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return BackGround(
          widget: SafeArea(
            child: SingleChildScrollView(
              child: FadeInUp(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        const BackIcon(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                        const Text(
                          'Hello Again !',
                          style: Styles.textStyle35,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Welcome back you have been missed!',
                          textAlign: TextAlign.center,
                          style: Styles.textStyle30.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormField(
                          borderRadius: 20,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          prefixIcon: FontAwesomeIcons.solidEnvelope,
                          obscureText: false,
                          suffix: const SizedBox(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextFormField(
                          borderRadius: 20,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Password',
                          prefixIcon: FontAwesomeIcons.lock,
                          obscureText: cubit.isVisible,
                          suffix: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 20),
                            child: GestureDetector(
                              onTap: () {
                                cubit.changeEye();
                              },
                              child: FaIcon(
                                cubit.isVisible
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                color: KColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        state is LoginLoadingState
                            ?   LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 70,
        )
                            : CustomButton(
                                onTap: () {
                                  _clickOnLogin(cubit);
                                },
                                text: 'Login',
                          borderRadius: 20,
                
                              ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'Or continue with',
                          style: Styles.textStyle18,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        state is LoginWithGoogleLoadingState
                            ?   LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 70,
        )
                            :    const SignWithGoogle(),
                
                        const SizedBox(
                          height: 25,
                        ),
                        const GoToRegister(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _clickOnLogin(LoginCubit cubit) {
    if (loginFormKey.currentState!.validate()) {
    LoginDataModel loginDataModel = LoginDataModel(
      email: emailController.text,
      password: passwordController.text,
    );
    cubit.login(
      loginDataModel: loginDataModel,
    );
    }
  }



}



