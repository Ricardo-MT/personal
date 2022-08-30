import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBackgroundColor extends StatefulWidget {
  const AnimatedBackgroundColor({
    Key? key,
    this.child,
    required this.controller,
    required this.sections,
  }) : super(key: key);
  final Widget? child;
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
    double sectionH =
        widget.controller.position.maxScrollExtent / (widget.sections - 1);
    int pos = widget.controller.offset ~/ (sectionH);

    double p = widget.controller.offset - sectionH * pos;

    setState(() {
      _color = Color.lerp(_colors[pos],
          _colors[min(pos + 1, widget.sections - 1)], p / sectionH);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(color: _color),
      duration: const Duration(milliseconds: 10),
      curve: Curves.fastOutSlowIn,
      child: widget.child,
    );
  }
}

const _colors = [
  Color(0xFF1D1D1D),
  Color(0xFF321CB1),
  Color(0xFFA71F1D),
  Color(0xFFD6DD09),
  Color(0xFF255430),
  Color(0xFF1D1D1D),
];
