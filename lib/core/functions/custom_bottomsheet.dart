import 'package:flutter/material.dart';
import '../widgets/glass_box.dart';

void customBottomSheet({required context,required Widget widget})=>showModalBottomSheet(

    context: context,
    shape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    backgroundColor: Colors.transparent,
    elevation: 0,
    barrierColor: Colors.transparent,

    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GlassBox(
          widget: widget,
          color: Colors.white.withOpacity(.3),
          border: true,
          borderRadius: 28,
          x: 20,
          y: 20,
        ),
      );
    });


