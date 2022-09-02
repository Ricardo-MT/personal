// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_1.dart';
import 'package:ricardomejiastravieso/view/widgets/animated_background_color.dart';
import 'package:ricardomejiastravieso/view/widgets/animated_background_radial_gradient.dart';
import 'package:flutter/foundation.dart';

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

  void handlePrimaryRegion(double dy) {
    // Primary
    double sH = _controllerPrimary.position.maxScrollExtent / 5;
    double pY = _controllerPrimary.offset;
    double MY = _controllerPrimary.position.maxScrollExtent;

    // Secondary
    double p2Y = _controller2.offset;
    double M2Y = _controller2.position.maxScrollExtent;

    // Secondary
    double p3Y = _controller3.offset;
    double M3Y = _controller3.position.maxScrollExtent;

    // Está en la 1ra
    if (pY < sH * 2) {
      moveTo(_controllerPrimary, max(0, min(sH * 2, pY + dy)));
      // _controllerPrimary.animateTo(pY + dy,
      //     duration: const Duration(milliseconds: 800), curve: Curves.ease);
      // _controllerPrimary.jumpTo(max(0, min(sH * 2, pY + dy)));
      return;
    }

    // Está en la 2da sección
    if (pY == sH * 2) {
      if (dy > 0) {
        if (p2Y + dy > M2Y) {
          moveTo(_controller2, M2Y);
          // _controller2.jumpTo(
          //   M2Y,
          // );
          moveTo(_controllerPrimary, sH * 2 + p2Y + dy - M2Y);
          // _controllerPrimary.jumpTo(sH * 2 + p2Y + dy - M2Y);
          return;
        }
      } else {
        if (p2Y + dy < 0) {
          moveTo(_controller2, 0);
          // _controller2.jumpTo(
          //   0,
          // );
          moveTo(_controllerPrimary, sH * 2 + p2Y + dy);
          // _controllerPrimary.jumpTo(sH * 2 + p2Y + dy);
          return;
        }
      }
      moveTo(_controller2, p2Y + dy);
      // _controller2.jumpTo(p2Y + dy);
      return;
    }

    // Está en la 3ra
    if (pY < sH * 4) {
      moveTo(_controllerPrimary, max(sH * 2, min(sH * 4, pY + dy)));
      // _controllerPrimary.jumpTo(
      //   max(sH, min(sH * 4, pY + dy)),
      // );
      return;
    }

    // Está en la 4ta sección
    if (pY == sH * 4) {
      if (dy > 0) {
        if (p3Y + dy > M3Y) {
          moveTo(_controller3, M3Y);
          // _controller3.jumpTo(
          //   M3Y,
          // );
          moveTo(_controllerPrimary, sH * 4 + p3Y + dy - M3Y);
          // _controllerPrimary.jumpTo(sH * 4 + p3Y + dy - M3Y);
          return;
        }
      } else {
        if (p3Y + dy < 0) {
          moveTo(_controller3, 0);
          // _controller3.jumpTo(
          //   0,
          // );
          moveTo(_controllerPrimary, sH * 4 + p3Y + dy);
          // _controllerPrimary.jumpTo(sH * 4 + p3Y + dy);
          return;
        }
      }
      moveTo(_controller3, p3Y + dy);
      // _controller3.jumpTo(p3Y + dy);
      return;
    }

    if (pY + dy < sH * 2) {
      moveTo(_controllerPrimary, sH * 2);
      // _controllerPrimary.jumpTo(sH * 2);
      moveTo(_controller2, M2Y - sH * 2 + (pY + dy));
      // _controller2.jumpTo(M2Y - sH * 2 + (pY + dy));
      return;
    }

    if (pY + dy < sH * 4) {
      moveTo(_controllerPrimary, sH * 4);
      // _controllerPrimary.jumpTo(sH * 4);
      moveTo(_controller3, M3Y - sH * 4 + (pY + dy));
      // _controller3.jumpTo(M3Y - sH * 4 + (pY + dy));
      return;
    }
    moveTo(
      _controllerPrimary,
      min(MY, pY + dy),
    );
    // _controllerPrimary.jumpTo(
    //   min(MY, pY + dy),
    // );
    return;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final tH = h * 6;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: h,
            width: w,
            child: AnimatedBackgroundColor(
              controller: _controllerPrimary,
              sections: 6,
              sectionHeight: h,
              totalheight: tH,
            ),
          ),
          SizedBox(
            height: h,
            width: w,
            child: AnimatedRadialGradient(
              controller: _controllerPrimary,
              sections: 6,
              sectionHeight: h,
              totalheight: tH,
            ),
          ),
          SizedBox(
            height: h,
            width: w,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _controllerPrimary,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: h,
                    width: w,
                    child: SectionInitial(
                      sections: 6,
                      controller: _controllerPrimary,
                    ),
                  ),
                  SizedBox(
                    height: h,
                    width: w,
                    child: const Center(child: Text("Primero")),
                  ),
                  SizedBox(
                    height: h,
                    child: PageView(
                      controller: _controller2,
                      pageSnapping: false,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        SizedBox(
                          child: Center(child: Text("SEGUNDO")),
                        ),
                        SizedBox(
                          child: Center(child: Text("SEGUNDO")),
                        ),
                        SizedBox(
                          child: Center(child: Text("SEGUNDO")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h,
                    width: w,
                    child: const Center(child: Text("TERCERO")),
                  ),
                  SizedBox(
                    height: h,
                    child: PageView(
                      controller: _controller3,
                      pageSnapping: false,
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        SizedBox(
                          child: Center(child: Text("CUARTO")),
                        ),
                        SizedBox(
                          child: Center(child: Text("CUARTO")),
                        ),
                        SizedBox(
                          child: Center(child: Text("CUARTO")),
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
        ],
      ),
    );
  }
}

void moveTo(ScrollController controller, double dy) {
  if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android) {
    controller.animateTo(
      dy,
      duration: const Duration(milliseconds: 600),
      curve: Curves.linearToEaseOut,
    );
  }
  if (defaultTargetPlatform == TargetPlatform.macOS) {
    controller.jumpTo(dy);
  }
  if (defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.windows) {
    controller.animateTo(
      dy,
      duration: const Duration(milliseconds: 600),
      curve: Curves.linearToEaseOut,
    );
  }
}
