// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/view/widgets/animated_background_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controllerPrimary = ScrollController();
  final PageController _controller2 = PageController();
  final PageController _controller3 = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerPrimary.dispose();
    _controller2.dispose();
    _controller3.dispose();
  }

  void handlePrimaryRegion(PointerScrollEvent event) {
    // Event
    double dy = event.scrollDelta.dy;

    // Primary
    double sH = _controllerPrimary.position.maxScrollExtent / 4;
    double pY = _controllerPrimary.offset;
    double MY = _controllerPrimary.position.maxScrollExtent;

    // Secondary
    double p2Y = _controller2.offset;
    double M2Y = _controller2.position.maxScrollExtent;

    // Secondary
    double p3Y = _controller3.offset;
    double M3Y = _controller3.position.maxScrollExtent;

    // Está en la 1ra
    if (pY < sH) {
      _controllerPrimary.jumpTo(
        max(0, min(sH, pY + dy)),
      );
      return;
    }

    // Está en la 2da sección
    if (pY == sH) {
      if (dy > 0) {
        if (p2Y + dy > M2Y) {
          _controller2.jumpTo(
            M2Y,
          );
          _controllerPrimary.jumpTo(sH + p2Y + dy - M2Y);
          return;
        }
      } else {
        if (p2Y + dy < 0) {
          _controller2.jumpTo(
            0,
          );
          _controllerPrimary.jumpTo(sH + p2Y + dy);
          return;
        }
      }
      _controller2.jumpTo(p2Y + dy);
      return;
    }

    // Está en la 3ra
    if (pY < sH * 3) {
      _controllerPrimary.jumpTo(
        max(sH, min(sH * 3, pY + dy)),
      );
      return;
    }

    // Está en la 4ta sección
    if (pY == sH * 3) {
      if (dy > 0) {
        if (p3Y + dy > M3Y) {
          _controller3.jumpTo(
            M3Y,
          );
          _controllerPrimary.jumpTo(sH * 3 + p3Y + dy - M3Y);
          return;
        }
      } else {
        if (p3Y + dy < 0) {
          _controller3.jumpTo(
            0,
          );
          _controllerPrimary.jumpTo(sH * 3 + p3Y + dy);
          return;
        }
      }
      _controller3.jumpTo(p3Y + dy);
      return;
    }

    if (pY + dy < sH) {
      _controllerPrimary.jumpTo(sH);
      _controller2.jumpTo(M2Y - sH + (pY + dy));
      return;
    }

    if (pY + dy < sH * 3) {
      _controllerPrimary.jumpTo(sH * 3);
      _controller3.jumpTo(M3Y - sH * 3 + (pY + dy));
      return;
    }

    _controllerPrimary.jumpTo(
      min(MY, pY + dy),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            handlePrimaryRegion(event);
          }
        },
        child: AnimatedBackgroundColor(
          sections: 5,
          controller: _controllerPrimary,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _controllerPrimary,
              physics: const ClampingScrollPhysics(
                  parent: NeverScrollableScrollPhysics()),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        focal: Alignment.centerLeft,
                        radius: 2,
                        stops: [
                      0,
                      0.5,
                      1
                    ],
                        colors: [
                      Colors.transparent,
                      Colors.white,
                      Colors.transparent
                    ])),
                child: Column(
                  children: [
                    SizedBox(
                      height: h,
                      // width: w,
                      child: const Center(child: Text("PRIMERO")),
                    ),
                    SizedBox(
                      height: h,
                      child: PageView(
                        controller: _controller2,
                        pageSnapping: false,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            child: const Center(child: Text("SEGUNDO")),
                          ),
                          Container(
                            child: const Center(child: Text("SEGUNDO")),
                          ),
                          Container(
                            child: const Center(child: Text("SEGUNDO")),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h,
                      // width: w,
                      child: const Center(child: Text("TERCERO")),
                    ),
                    SizedBox(
                      height: h,
                      child: PageView(
                        controller: _controller3,
                        pageSnapping: false,
                        reverse: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            child: const Center(child: Text("CUARTO")),
                          ),
                          Container(
                            child: const Center(child: Text("CUARTO")),
                          ),
                          Container(
                            child: const Center(child: Text("CUARTO")),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h,
                      width: w,
                      child: const Center(child: Text("QUINTO")),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
