import 'package:flutter/material.dart';

class AnimatedRadialGradient extends StatefulWidget {
  const AnimatedRadialGradient({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<AnimatedRadialGradient> createState() => _AnimatedRadialGradient();
}

class _AnimatedRadialGradient extends State<AnimatedRadialGradient>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    reverseDuration: const Duration(seconds: 14),
    vsync: this,
  )..repeat(reverse: true);

  final DecorationTween decorationTween = DecorationTween(
    end: const BoxDecoration(
        gradient: RadialGradient(
            focal: Alignment.centerLeft,
            radius: 2,
            tileMode: TileMode.mirror,
            focalRadius: 0.15,
            stops: [0, 0.5, 1],
            colors: [Colors.transparent, Colors.white, Colors.transparent])),
    begin: BoxDecoration(
        gradient: RadialGradient(
            focal: Alignment.centerLeft,
            radius: 1,
            tileMode: TileMode.mirror,
            focalRadius: 0.2,
            stops: const [
          0,
          0.5,
          1
        ],
            colors: [
          Colors.transparent,
          Colors.white.withOpacity(0.6),
          Colors.transparent
        ])),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      decoration: decorationTween.animate(CurvedAnimation(
        parent: _controller,
        reverseCurve: Curves.easeInOut,
        curve: Curves.easeInOut,
      )),
      child: widget.child,
    );
  }
}
