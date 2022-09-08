import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MuiCard extends StatelessWidget {
  const MuiCard({
    Key? key,
    this.active = true,
    this.insetShadow = false,
    this.circular = false,
    this.width = 300,
    this.heigth = 120,
    this.child,
    this.backgroundColor = defaultBackgroundColor,
    this.colorStart = defaultColorStart,
    this.colorEnd = defaultColorEnd,
  }) : super(key: key);
  final bool active;
  final bool insetShadow;
  final bool circular;
  final double width;
  final double heigth;
  final Widget? child;
  final Color backgroundColor;
  final Color colorStart;
  final Color colorEnd;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: active ? 1 : 0.9,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width,
        height: heigth,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: circular ? null : BorderRadius.circular(26),
          shape: circular ? BoxShape.circle : BoxShape.rectangle,
          color: backgroundColor,
          boxShadow: active
              ? [
                  BoxShadow(
                    color: colorStart,
                    offset: offset,
                    blurRadius: blurRadius,
                    spreadRadius: spreadRadius,
                    inset: insetShadow,
                  ),
                  BoxShadow(
                    color: colorEnd,
                    offset: Offset(-offset.dx, -offset.dy),
                    blurRadius: blurRadius,
                    spreadRadius: spreadRadius,
                    inset: insetShadow,
                  ),
                ]
              : [],
        ),
        child: child,
      ),
    );
  }
}

class MuiBadge extends StatelessWidget {
  const MuiBadge({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF775A81),
          width: 2,
        ),
        shape: BoxShape.circle,
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4B3C50),
              Color(0xFF9678A0),
            ]),
      ),
      child: Center(child: child),
    );
  }
}

const blurRadius = 18.0;
const spreadRadius = 1.0;
const offset = Offset(4, 4);

const defaultBackgroundColor = Color(0xFF333333);
const defaultColorStart = Color(0xFF010101);
const defaultColorEnd = Color(0xFF555555);
