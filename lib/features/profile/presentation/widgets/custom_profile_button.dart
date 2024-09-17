import 'package:flutter/material.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/widgets/glass_box.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.text,
    required this.function,
  });
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          function();
        },
        child: GlassBox(
          widget: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(text, style: Styles.textStyle16black),
            ),
          ),
          color: Colors.blueGrey.withOpacity(.3),
          borderRadius: 10,
          x: 40,
          y: 40,
          border: false,
        ),
      ),
    );
  }
}
