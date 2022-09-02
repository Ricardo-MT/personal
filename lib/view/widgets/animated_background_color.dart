import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBackgroundColor extends StatefulWidget {
  const AnimatedBackgroundColor({
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
  State<AnimatedBackgroundColor> createState() => _AnimatedBackgroundColor();
}

class _AnimatedBackgroundColor extends State<AnimatedBackgroundColor> {
  Color? _color = _colors[0];

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
  }

  void listener() {
    int pos = widget.controller.offset ~/ (widget.sectionHeight);

    double p = widget.controller.offset - widget.sectionHeight * pos;

    setState(() {
      _color = Color.lerp(_colors[pos],
          _colors[min(pos + 1, widget.sections - 1)], p / widget.sectionHeight);
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
      key: const Key("BACKGROUND_LINEAR_GRADIENT"),
      child: AnimatedContainer(
        height: widget.sectionHeight,
        decoration: BoxDecoration(color: _color),
        duration: const Duration(milliseconds: 10),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}

const _colors = [
  Color(0xFF051923),
  Color(0xFF044367),
  Color.fromARGB(255, 17, 160, 117),
  Color.fromARGB(255, 161, 201, 244),
  Color.fromARGB(255, 164, 3, 3),
  Color.fromARGB(255, 255, 162, 105),
];
