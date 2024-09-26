
import 'package:flutter/material.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';
import '../../../../core/style/textStyles.dart';

verifyNotify(context){
  showFloatingTopBannerWidget(context: context, widget:
  Row(
    children: [
      const Icon(
        Icons.info_outline,
        color: Colors.deepOrange,
      ),
      const SizedBox(
        width: 15,
      ),
       Text(
          'Verify your account',
          style: Styles.textStyle16.copyWith(color: Colors.black),
      ),
      const Spacer(),
      TextButton(
          onPressed: () {

          },
          child: Text(
              'Send',
              style: Styles.textStyle16.copyWith(color: Colors.teal)
          )),
      IconButton(
          onPressed: () {
          },
          icon: const Icon(
            Icons.restart_alt,
            color: Colors.blueGrey,
          )),
    ],
  ),
  );

}
