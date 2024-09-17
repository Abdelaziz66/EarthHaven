import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/glass_box.dart';
import '../manager/login_cubit/login_cubit.dart';

class SignWithGoogle extends StatelessWidget {
  const SignWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        LoginCubit.get(context).loginWithGoogle();
      },
      child:  const GlassBox(
          widget: Padding(
            padding: EdgeInsets.all(10.0),
            child: FaIcon(FontAwesomeIcons.google),
          ),
          color: Colors.white,
          borderRadius: 30,
          x: 10,
          y: 10,
          border: false),
    );
  }
}