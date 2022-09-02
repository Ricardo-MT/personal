import 'package:flutter/material.dart';

class AnimatedRadialGradient extends StatefulWidget {
  const AnimatedRadialGradient({
    Key? key,
    required this.sectionHeight,
    required this.totalheight,
    required this.controller,
    required this.sections,
  }) : super(key: key);
  final double sectionHeight;
  final double totalheight;
  final ScrollController controller;
  final int sections;

  @override
  State<AnimatedRadialGradient> createState() => _AnimatedRadialGradient();
}

class _AnimatedRadialGradient extends State<AnimatedRadialGradient>
    with SingleTickerProviderStateMixin {
  final ScrollController _controllerPrimary = ScrollController();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    reverseDuration: const Duration(seconds: 14),
    vsync: this,
  )..repeat(reverse: true);

  final DecorationTween decorationTween = DecorationTween(
    end: const BoxDecoration(
        gradient: RadialGradient(
            focal: Alignment.centerLeft,
            radius: 4,
            tileMode: TileMode.mirror,
            focalRadius: 0.15,
            stops: [0, 0.5, 1],
            colors: [Colors.transparent, Colors.white, Colors.transparent])),
    begin: BoxDecoration(
        gradient: RadialGradient(
            focal: Alignment.centerLeft,
            radius: 2,
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
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
  }

  void listener() {
    _controllerPrimary.animateTo(widget.controller.offset,
        duration: const Duration(seconds: 6), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: const Key("BACKGROUND_RADIAL_GRADIENT"),
      child: SingleChildScrollView(
        controller: _controllerPrimary,
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(CurvedAnimation(
            parent: _controller,
            reverseCurve: Curves.easeInOut,
            curve: Curves.easeInOut,
          )),
          child: SizedBox(
            height: widget.totalheight,
          ),
        ),
      ),
    );
  }
}
