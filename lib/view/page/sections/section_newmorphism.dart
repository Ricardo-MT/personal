import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SectionInitialNewmorphism extends StatefulWidget {
  const SectionInitialNewmorphism({
    Key? key,
    required this.controller,
    required this.sections,
  }) : super(key: key);
  final ScrollController controller;
  final int sections;

  @override
  State<SectionInitialNewmorphism> createState() =>
      _SectionInitialNewmorphism();
}

class _SectionInitialNewmorphism extends State<SectionInitialNewmorphism>
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
    if (pos >= 1) {
      return;
    }
    double p = widget.controller.offset - sectionH * pos;
    setState(() {
      // borderWidth = 14 - p * 14 / sectionH;
      _anim = p / sectionH;
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

    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: h,
            child: Column(
              children: [
                const Spacer(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(),
                  reverse: false,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: w * _anim,
                      ),
                      SizedBox(
                        width: w,
                        child: Row(
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              "Ricardo",
                              style: style.copyWith(
                                fontFamily: "Comfortaa",
                                // shadows: [
                                //   for (int i = 0; i < 5; i++)
                                //     BoxShadow(
                                //       color: color,
                                //       blurRadius: (3 * i).toDouble(),
                                //       spreadRadius: 0,
                                //     ),
                                // ],
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: SizedBox(
                    height: h * 0.6,
                    width: 540,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(),
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      SizedBox(
                        width: w,
                        child: Row(
                          children: [
                            const Spacer(
                              flex: 21,
                            ),
                            Text(
                              "Ricardo",
                              style: style.copyWith(
                                fontFamily: "LibreBarcode",
                                // color: color,
                                // foreground: Paint()..shader = linearGradient,
                              ),
                            ),
                            const Spacer(
                              flex: 10,
                            )
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: w * _anim,
                      )
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          ScaleTransition(
            scale: _animation,
            // child: AnimatedContainer(
            //   width: 540 + (w - 540) * _anim,
            //   height: h * 0.6 + _anim * h * 0.8,
            //   duration: const Duration(milliseconds: 100),
            //   decoration: BoxDecoration(
            //       // color: Colors.blue,
            //       borderRadius: BorderRadius.circular(4),
            //       border: Border.all(
            //         color: const Color.fromARGB(255, 183, 45, 35)
            //             .withOpacity(1 - _anim),
            //         width: (18 - 18 * _anim),
            //       )),
            // ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: const Color(0xFF333333),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF010101).withOpacity(1 - _anim),
                    offset: offset,
                    blurRadius: blurRadius - blurRadius * _anim,
                    spreadRadius: spreadRadius - spreadRadius * _anim,
                    inset: inset,
                  ),
                  BoxShadow(
                    color: const Color(0xFF555555).withOpacity(1 - _anim),
                    offset: Offset(-offset.dx, -offset.dy),
                    blurRadius: blurRadius - blurRadius * _anim,
                    spreadRadius: spreadRadius - spreadRadius * _anim,
                    inset: inset,
                  ),
                ],
                // color: Colors.red,
                // image: DecorationImage(
                //     image: AssetImage("assets/images/cuba_a.png"),
                //     colorFilter: ColorFilter.linearToSrgbGamma()),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(
                flex: 3,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      width: w,
                      child: Row(
                        children: [
                          const Spacer(),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: max(1 - _anim * 2, 0),
                            child: Text(
                              "software",
                              style: style.copyWith(
                                fontFamily: family,
                                fontSize: max(w * 0.09, 60),
                                color: color,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: _anim * 400,
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                reverse: false,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: _anim * 400,
                    ),
                    SizedBox(
                      width: w,
                      child: Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: max(1 - _anim * 2, 0),
                          child: Text(
                            "developer",
                            style: style.copyWith(
                              fontFamily: family,
                              fontSize: w * 0.09,
                              foreground: Paint()..shader = linearGradient,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 6,
              ),
            ],
          ),
        ],
      ),
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