import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/style/textStyles.dart';
import '../../../../core/utils/app_router.dart';

class GoToRegister extends StatelessWidget {
  const GoToRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Not a member !',
          style: Styles.textStyle16,
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kRegister);
          },
          child: const Text(
            'Register Now',
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
