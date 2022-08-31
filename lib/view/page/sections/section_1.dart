import 'dart:math';

import 'package:flutter/material.dart';

class SectionInitial extends StatefulWidget {
  const SectionInitial({
    Key? key,
    required this.controller,
    required this.sections,
  }) : super(key: key);
  final ScrollController controller;
  final int sections;

  @override
  State<SectionInitial> createState() => _SectionInitial();
}

class _SectionInitial extends State<SectionInitial>
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
                              style: style.copyWith(fontFamily: "Gloria"),
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
                // Row(
                //   children: [
                //     const Spacer(
                //       flex: 21,
                //     ),
                //     Text(
                //       "Ricardo",
                //       style: style.copyWith(fontFamily: "LibreBarcode"),
                //     ),
                //     const Spacer(
                //       flex: 10,
                //     )
                //   ],
                // ),
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
                              style: style.copyWith(fontFamily: "LibreBarcode"),
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
            child: AnimatedContainer(
              width: 540 + (w - 540) * _anim,
              height: h * 0.6 + _anim * h * 0.8,
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color.fromARGB(255, 183, 45, 35)
                        .withOpacity(1 - _anim),
                    width: (18 - 18 * _anim),
                  )),
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
                                  fontFamily: "Bungee",
                                  fontSize: max(w * 0.09, 60)),
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
                                fontFamily: "Bungee", fontSize: w * 0.09),
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
