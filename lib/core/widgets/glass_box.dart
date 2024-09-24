import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  const GlassBox({
    super.key,
    required this.widget,
    required this.color,
    required this.borderRadius,
    required this.x,
    required this.y,
    required this.border,
  });
  final Widget widget;
  final Color color;
  final double borderRadius;
  final double x;
  final double y;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: y,
          sigmaX: x,
          tileMode: TileMode.clamp,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: border
                ? Border.all(
                    color: Colors.white54, style: BorderStyle.solid, width: 1)
                : null,
          ),
          child: widget,
        ),
      ),
    );
  }
}

class GlassBoxWithCustomBorder extends StatelessWidget {
  const GlassBoxWithCustomBorder({
    super.key,
    required this.widget,
    required this.color,
    required this.borderRadius,
    required this.x,
    required this.y,
    required this.border,
  });
  final Widget widget;
  final Color color;
  final double borderRadius;
  final double x;
  final double y;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(borderRadius),
        bottomLeft: Radius.circular(borderRadius),
        topLeft: const Radius.circular(0),
        bottomRight: Radius.circular(borderRadius),
      ),      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: y,
          sigmaX: x,
          tileMode: TileMode.clamp,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius),
              topLeft: const Radius.circular(0),
              bottomRight: Radius.circular(borderRadius),
            ),
            border: border
                ? Border.all(
                    color: Colors.white54, style: BorderStyle.solid, width: 1)
                : null,
          ),
          child: widget,
        ),
      ),
    );
  }
}

class GlassBoxWithOnlyTopBorder extends StatelessWidget {
  const GlassBoxWithOnlyTopBorder({
    super.key,
    required this.widget,
    required this.color,
    required this.borderRadius,
    required this.x,
    required this.y,
    required this.border,
  });
  final Widget widget;
  final Color color;
  final double borderRadius;
  final double x;
  final double y;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(borderRadius),
        bottomLeft: const Radius.circular(0),
        topLeft:  Radius.circular(borderRadius),
        bottomRight: const Radius.circular(0),
      ),      child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: y,
        sigmaX: x,
        tileMode: TileMode.clamp,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(borderRadius),
            bottomLeft: const Radius.circular(0),
            topLeft:  Radius.circular(borderRadius),
            bottomRight: const Radius.circular(0),
          ),
          border: border
              ? Border.all(
              color: Colors.white54, style: BorderStyle.solid, width: 1)
              : null,
        ),
        child: widget,
      ),
    ),
    );
  }
}
