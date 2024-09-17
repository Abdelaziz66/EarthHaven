import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/style/textStyles.dart';
import '../../../../core/utils/app_router.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have an account !',
          style: Styles.textStyle16,
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kLogin);
          },
          child: const Text(
            'Login now',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
