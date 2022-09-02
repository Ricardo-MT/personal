import 'package:flutter/material.dart';

class AnimatedCubaStamp extends StatefulWidget {
  const AnimatedCubaStamp({
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
  State<AnimatedCubaStamp> createState() => _AnimatedCubaStampState();
}

class _AnimatedCubaStampState extends State<AnimatedCubaStamp> {
  double opacity = 0;
  double turns = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
  }

  void listener() {
    int pos = widget.controller.offset ~/ (widget.sectionHeight);

    double p = widget.controller.offset - widget.sectionHeight * pos;

    setState(() {
      opacity = widget.controller.offset > widget.sectionHeight / 2 ? 1 : 0;
      turns = pos + p / widget.sectionHeight;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: const Key("BACKGROUND_CUBA_STAMP"),
      child: SizedBox(
        height: widget.sectionHeight,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 1),
              child: AnimatedRotation(
                turns: turns,
                curve: Curves.elasticOut,
                duration: const Duration(milliseconds: 3000),
                child: Image.asset(
                  "assets/images/cuba_a.png",
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
