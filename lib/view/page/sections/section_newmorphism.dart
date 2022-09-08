import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:ricardomejiastravieso/view/widgets/card.dart';

class SectionInitialNewmorphism extends StatefulWidget {
  const SectionInitialNewmorphism({
    Key? key,
    required this.controller,
    required this.sections,
    required this.sectionH,
    required this.sectionW,
    required this.totalH,
  }) : super(key: key);
  final ScrollController controller;
  final int sections;
  final double sectionH;
  final double sectionW;
  final double totalH;

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
    // double sectionH =
    //     widget.controller.position.maxScrollExtent / (widget.sections - 1);
    int pos = widget.controller.offset ~/ (widget.sectionH);
    if (pos >= 1) {
      return;
    }
    double p = widget.controller.offset - widget.sectionH * pos;
    setState(() {
      // borderWidth = 14 - p * 14 / sectionH;
      _anim = p / widget.sectionH;
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
    String family = "Monoton";

    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: widget.sectionH,
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
                        width: widget.sectionW * _anim,
                      ),
                      SizedBox(
                        width: widget.sectionW,
                        child: Row(
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              "Ricardo",
                              style: style.copyWith(
                                fontFamily: "Comfortaa",
                                color: const Color(0xFFCECECE),
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
                    height: widget.sectionH * 0.6,
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
                        width: widget.sectionW,
                        child: Row(
                          children: [
                            const Spacer(
                              flex: 21,
                            ),
                            Text(
                              "<Ricardo/>",
                              style: style.copyWith(
                                fontFamily: "LibreBarcode",
                                color: const Color(0xFFCECECE),
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
                        width: widget.sectionW * _anim,
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
            // child: AnimatedContainer(
            //   duration: const Duration(milliseconds: 200),
            //   curve: Curves.fastOutSlowIn,
            //   width: 300,
            //   height: 300,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(150),
            //     color: const Color(0xFF333333),
            //     boxShadow: [
            //       BoxShadow(
            //         color: const Color(0xFF010101),
            //         offset: offset,
            //         blurRadius: blurRadius - blurRadius * 0,
            //         spreadRadius: spreadRadius - spreadRadius * 0,
            //         inset: inset,
            //       ),
            //       BoxShadow(
            //         color: const Color(0xFF555555),
            //         offset: Offset(-offset.dx, -offset.dy),
            //         blurRadius: blurRadius - blurRadius * 0,
            //         spreadRadius: spreadRadius - spreadRadius * 0,
            //         inset: inset,
            //       ),
            //     ],
            //     // color: Colors.red,
            //     // image: DecorationImage(
            //     //     image: AssetImage("assets/images/cuba_a.png"),
            //     //     colorFilter: ColorFilter.linearToSrgbGamma()),
            //   ),
            // ),
            child: const MuiCard(
              circular: true,
              // active: _anim > 0.1 ? true : false,
              width: 400,
              heigth: 400,
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
                      width: widget.sectionW,
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
                                fontSize: max(widget.sectionW * 0.09, 60),
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
                      width: widget.sectionW,
                      child: Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: max(1 - _anim * 2, 0),
                          child: Text(
                            "developer",
                            style: style.copyWith(
                              fontFamily: family,
                              fontSize: widget.sectionW * 0.09,
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

var color = const Color(0xFF8a6c94);
var style = const TextStyle(color: Colors.white, fontSize: 40);
