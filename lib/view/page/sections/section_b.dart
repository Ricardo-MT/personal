import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({
    Key? key,
    required this.controller,
    required this.sections,
  }) : super(key: key);
  final ScrollController controller;
  final int sections;

  @override
  State<SecondSection> createState() =>
      _SecondSection();
}

class _SecondSection extends State<SecondSection>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  double _anim = 0;
  double _top = 0;

  @override
  void initState() {
    super.initState();
    _controller.forward();
    widget.controller.addListener(listener);
  }

  void listener() {
    double sectionH =
        widget.controller.position.maxScrollExtent / (widget.sections - 1);
    int pos = widget.controller.offset ~/ (sectionH);
    if (pos < 1) {
      return;
    }
    if (pos > 3) {
      return;
    }
    double p = widget.controller.offset - sectionH * pos;
    setState(() {
      // borderWidth = 14 - p * 14 / sectionH;
      // _anim = p / sectionH;
      _top = p + (pos-1)*sectionH;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listener);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(color: Colors.white, fontSize: 40);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    bool inset = false;
    double blurRadius = 18;
    double spreadRadius = 1;
    var offset = const Offset(4, 4);
    String family = "Bungee";
    // family = "Fascinate";
    // family = "Gloria";
    family = "Monoton";
    // family = "Monofett";
    // family = "Rancho";
    // family = "RubikBurned";
    // family = "RubikMarkerHatch";
    var color = const Color(0xFF8a6c94);
    var sigmaBlur = 160.0;

    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 0),
          curve: Curves.ease,
          right: 0,
          left: 0,
          top: _top,
          child: SizedBox(
            width: w,
            height: h,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
        )
      ],
    );
  }
}

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 150, 120, 160),
    Color.fromARGB(255, 120, 89, 130)
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 60.0));

// boxShadow: [
                  //   BoxShadow(
                  //     color: const Color(0xFF010101).withOpacity(1 - _anim),
                  //     offset: offset,
                  //     blurRadius: blurRadius - blurRadius * _anim,
                  //     spreadRadius: spreadRadius - spreadRadius * _anim,
                  //     inset: inset,
                  //   ),
                  //   BoxShadow(
                  //     color: const Color(0xFF555555).withOpacity(1 - _anim),
                  //     offset: Offset(-offset.dx, -offset.dy),
                  //     blurRadius: blurRadius - blurRadius * _anim,
                  //     spreadRadius: spreadRadius - spreadRadius * _anim,
                  //     inset: inset,
                  //   ),
                  // ],