import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as shadow;

class MuiCard extends StatelessWidget {
  const MuiCard({
    Key? key,
    this.active = true,
    this.insetShadow = false,
    this.circular = false,
    this.width = 300,
    this.heigth = 120,
    this.child,
    // this.backgroundColor = AppColors.defaultBackgroundColor,
    // this.colorStart = AppColors.defaultColorStart,
    // this.colorEnd = AppColors.defaultColorEnd,
    this.backgroundColor,
    this.colorStart,
    this.colorEnd,
    this.curve = Curves.fastOutSlowIn,
    this.containerDuration = 300,
    this.decorated = false,
  }) : super(key: key);
  final bool active;
  final bool insetShadow;
  final bool circular;
  final double width;
  final double heigth;
  final Widget? child;
  final Color? backgroundColor;
  final Color? colorStart;
  final Color? colorEnd;
  final Curve curve;
  final int containerDuration;
  final bool decorated;

  @override
  Widget build(BuildContext context) {
    var localBackgroundColor =
        backgroundColor ?? Theme.of(context).colorScheme.onPrimary;
    var localColorStart =
        colorStart ?? Theme.of(context).colorScheme.onSecondary;
    var localColorEnd = colorEnd ?? Theme.of(context).colorScheme.onTertiary;

    return AnimatedScale(
      scale: active ? (insetShadow ? 0.9 : 1) : (insetShadow ? 1 : 0.9),
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      child: AnimatedContainer(
        duration: Duration(milliseconds: containerDuration),
        width: width,
        height: heigth,
        curve: curve,
        decoration: shadow.BoxDecoration(
          borderRadius: circular ? null : BorderRadius.circular(26),
          shape: circular ? BoxShape.circle : BoxShape.rectangle,
          color: localBackgroundColor,
          boxShadow: active
              ? [
                  shadow.BoxShadow(
                    color: localColorStart,
                    offset: offset,
                    blurRadius: blurRadius,
                    spreadRadius: spreadRadius,
                    inset: insetShadow,
                  ),
                  shadow.BoxShadow(
                    color: localColorEnd,
                    offset: Offset(-offset.dx, -offset.dy),
                    blurRadius: blurRadius,
                    spreadRadius: spreadRadius,
                    inset: insetShadow,
                  ),
                ]
              : [],
        ),
        child: decorated
            ? RepaintBoundary(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: circular ? null : BorderRadius.circular(26),
                      shape: circular ? BoxShape.circle : BoxShape.rectangle,
                      image: DecorationImage(
                          image: width > heigth
                              ? const AssetImage("assets/images/decoration.png")
                              : const AssetImage(
                                  "assets/images/decorationVertical.png"),
                          opacity: insetShadow ? 0.8 : 1,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topRight),
                    ),
                    child: child))
            : child,
      ),
    );
  }
}

class MuiBadge extends StatelessWidget {
  const MuiBadge({
    Key? key,
    this.child,
    this.inverted = false,
    this.colorStart = const Color(0xFF4B3C50),
    this.colorEnd = const Color(0xFF9678A0),
    this.backgroundColor = const Color(0xFF775A81),
    this.size = 60,
  }) : super(key: key);
  final Widget? child;
  final bool inverted;
  final Color backgroundColor;
  final Color colorStart;
  final Color colorEnd;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: backgroundColor,
          width: 2,
        ),
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: inverted
                ? [
                    colorEnd,
                    colorStart,
                  ]
                : [
                    colorStart,
                    colorEnd,
                  ]),
      ),
      child: Center(child: child),
    );
  }
}

const blurRadius = 15.0;
const spreadRadius = 1.0;
const offset = Offset(3, 3);

enum MuiCardDecoration { vertical, horizontal }
