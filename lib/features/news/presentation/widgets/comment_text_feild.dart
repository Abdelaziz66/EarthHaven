import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/textStyles.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({
    super.key,
    required this.commentController,
  });

  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.5,
      // color: Colors.green,
      child: Center(
        child: TextFormField(
          controller: commentController,
          keyboardType:TextInputType.text,
          obscureText: false,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Message can\'t be empty';
            }
            return null;
          },
          // textAlignVertical: TextAlignVertical.center,
          cursorColor: KColors.thirdColor,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.white60),
          decoration: InputDecoration(
            hintText: 'Add Reply  . . .',
            hintStyle: Styles.textStyle12.copyWith(color: Colors.white54),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 5),
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorStyle: Styles.textStyle12.copyWith(color: Colors.black45),
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            // error: Padding(
            //   padding: const EdgeInsets.only(left: 55.0),
            //   child: Text('Required'),
            // ),
            filled: false,


          ),
        ),
      ),
    );
  }
}
