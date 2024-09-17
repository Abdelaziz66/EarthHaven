
import 'package:flutter/material.dart';

import '../style/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.onTap, required this.text,this.borderRadius

  });


  final Function onTap;
  final String text;
  final double? borderRadius;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width<600? MediaQuery.of(context).size.width: 600,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius??30),
        color: KColors.primaryColor,
      ),
      child: TextButton(
        onPressed: (){onTap();},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey[300],
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}