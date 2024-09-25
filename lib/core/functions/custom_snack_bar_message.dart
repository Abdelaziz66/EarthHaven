import 'package:animate_do/animate_do.dart';
import 'package:earth_haven/core/style/textStyles.dart';
import 'package:earth_haven/core/widgets/glass_box.dart';
import 'package:flutter/material.dart';

showSnackBar({required context, required String message}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,

       behavior: SnackBarBehavior.fixed,
       duration: const Duration(seconds: 2),
        content: Text(
          message,
          style: const TextStyle(fontSize: 15
          ,color: Colors.white),

        ),
      ),
    );

void showTopSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      dividerColor: Colors.transparent,
      forceActionsBelow: false,
      shadowColor: Colors.transparent,
      overflowAlignment: OverflowBarAlignment.start,
      padding:const EdgeInsets.all(0),
      margin: const EdgeInsets.only(top: 20,left: 10,right: 10),

      content: GlassBox(widget: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ), color: Colors.white30, borderRadius: 20, x: 100, y: 100, border: false),
      actions: const [
        // // TextButton(
        // //   onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        // //   child: const Text(
        // //     'DISMISS',
        // //     style: TextStyle(color: Colors.white),
        // //   ),
        // // ),
        SizedBox(),
      ],
      leading:        SizedBox(),
    ),
  );

  // Automatically dismiss the banner after a delay
  Future.delayed(const Duration(seconds: 2), () {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  });
}

void showFloatingTopBanner({required BuildContext context, required String message}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 40, // Position it from the top
      left: 10,
      right: 10,
      child: FadeInDown(
        duration: const Duration(milliseconds: 300),
        child: Material(
          color: Colors.transparent,
          child: GlassBox(
            widget: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                message,
                style: Styles.textStyle16.copyWith(color: Colors.black),
              ),
            ),
            color: Colors.white38,
            borderRadius: 20,
            x: 50,
            y: 15,
            border: false,
          ),
        ),
      ),
    ),
  );

  // Insert the overlay entry
  overlay.insert(overlayEntry);

  // Automatically remove the banner after a delay
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}