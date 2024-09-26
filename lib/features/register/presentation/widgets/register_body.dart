import 'package:animate_do/animate_do.dart';
import 'package:earth_haven/core/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/widgets/back_icon.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../data/models/register_model.dart';
import '../manager/register_cubit/register_cubit.dart';
import 'have_account.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showFloatingTopBanner(message: 'Register Successful :)', context: context);
        }
        if (state is RegisterErrorState) {
          showFloatingTopBanner(message: 'Register Failed :(', context: context);
        }
      },
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return BackGround(
          widget: SafeArea(
            child: SingleChildScrollView(
              child: FadeInUp(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Form(
                      key: registerFormKey,
                      child: Column(
                        children: [
                          const BackIcon(),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Register',
                            style: Styles.textStyle35,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Welcome to EarthHaven!',
                            style: Styles.textStyle25
                                .copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormField(
                            borderRadius: 20,
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            hintText: 'User name',
                            prefixIcon: FontAwesomeIcons.solidUser,
                            obscureText: false,
                            suffix: const SizedBox(),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextFormField(
                            borderRadius: 20,
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            hintText: 'Phone number',
                            prefixIcon: FontAwesomeIcons.phone,
                            obscureText: false,
                            suffix: const SizedBox(),
                          ),
                          const SizedBox(
                            height: 12,
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
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 20),
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
                          state is RegisterLoadingState
                              ?   LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 70,
        )
                              : CustomButton(
                                  onTap: () {
                                    _clickOnRegister(cubit);
                                  },
                                  text: 'Register',
                            borderRadius: 20,
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          const HaveAccount(),
                        ],
                      ),
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

  void _clickOnRegister(RegisterCubit cubit) {
    if (registerFormKey.currentState!.validate()) {
      RegisterModel registerModel = RegisterModel(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          phone: phoneController.text);
      cubit.register(
        registerModel: registerModel,
      );
    }
  }
}

