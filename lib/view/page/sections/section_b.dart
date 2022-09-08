import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:ricardomejiastravieso/utils/theming.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({
    Key? key,
    required this.controller,
    required this.sections,
    required this.sectionH,
    required this.totalH,
  }) : super(key: key);
  final ScrollController controller;
  final int sections;
  final double sectionH;
  final double totalH;

  @override
  State<SecondSection> createState() => _SecondSection();
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
  final double _anim = 0;
  double _top = 0;
  double _percent = 0;

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
    if (pos < 1) {
      return;
    }
    if (pos > 3) {
      return;
    }
    double p = widget.controller.offset - widget.sectionH * pos;
    setState(() {
      // borderWidth = 14 - p * 14 / sectionH;
      // _anim = p / sectionH;
      _top = min(p + (pos - 1) * widget.sectionH, widget.sectionH);
      _percent = _top / widget.sectionH;
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
          duration: const Duration(milliseconds: 0),
          curve: Curves.ease,
          right: 0,
          left: 0,
          top: _top,
          child: SizedBox(
            width: w,
            height: h,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  MuiTimeline(
                    height: h - 30,
                    progress: _percent,
                  ),
                  _spacer,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedOpacity(
                          // opacity: _percent > 0.08 ? 1 : 0,
                          opacity: min(1, _percent / 0.25 * 3),
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear,
                          child: MuiTrayectoryCard(
                            active: _percent > 0.12,
                            insetShadow: _percent > 0.37,
                            icon: Icons.local_library_outlined,
                            title: "A-Levels",
                            location: "IPVCE Lenin, Havana",
                            time: "2009-2012",
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: min(1, max(0, (_percent - 0.25) / 0.25 * 3)),
                          // opacity: _percent > 0.3 ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                          child: MuiTrayectoryCard(
                            active: _percent > 0.37,
                            insetShadow: _percent > 0.62,
                            icon: Icons.book_outlined,
                            title: "2 years in CS",
                            location: "University of Havana, Havana",
                            time: "2013-2015",
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: min(1, max(0, (_percent - 0.5) / 0.25 * 3)),
                          // opacity: _percent > 0.58 ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                          child: MuiTrayectoryCard(
                            active: _percent > 0.62,
                            insetShadow: _percent > 0.8,
                            icon: Icons.school_outlined,
                            title: "HND Software Dev.",
                            location: "IES Saladillo, Algeciras",
                            time: "2020-2022",
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: min(1, max(0, (_percent - 0.70) / 0.25 * 3)),
                          // opacity: _percent > 0.8 ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                          child: MuiTrayectoryCard(
                            active: _percent > 0.8,
                            // insetShadow: _percent > 0.25,
                            icon: Icons.important_devices_rounded,
                            title: "Fullstack Developer",
                            location: "Boorpret, Cádiz",
                            time: "2020-2022",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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

class MuiTrayectoryCard extends StatelessWidget {
  const MuiTrayectoryCard({
    Key? key,
    this.active = true,
    this.insetShadow = false,
    required this.icon,
    required this.title,
    required this.location,
    required this.time,
  }) : super(key: key);
  final bool active;
  final bool insetShadow;
  final IconData icon;
  final String title;
  final String location;
  final String time;

  @override
  Widget build(BuildContext context) {
    String familyA = "Bungee";
    // familyA = "Fascinate";
    // familyA = "Gloria";
    // familyA = "Monofett";
    // familyA = "Monoton";
    // familyA = "Rancho";
    // familyA = "RubikBurned";
    // familyA = "RubikMarkerHatch";
    // familyA = "Comfortaa";
    // familyA = "Varela";
    familyA = "Montserrat";

    String familyB = "Bungee";
    // familyB = "Fascinate";
    // familyB = "Gloria";
    // familyB = "Monofett";
    // familyB = "Monoton";
    // familyB = "Rancho";
    // familyB = "RubikBurned";
    // familyB = "RubikMarkerHatch";
    // familyB = "Varela";
    // familyB = "Montserrat";
    familyB = "Comfortaa";

    return MuiCard(
      heigth: 92,
      width: 294,
      active: active,
      insetShadow: insetShadow,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0).copyWith(left: 20),
            child: MuiBadge(
                child: Icon(
              icon,
              size: 28,
              color: AppColors.whitePrimary,
            )),
          )),
          Expanded(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20).copyWith(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.whitePrimary,
                    fontSize: 17,
                    fontFamily: familyA,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  location,
                  style: TextStyle(
                    color: AppColors.whiteAccent,
                    fontSize: 12,
                    fontFamily: familyB,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: AppColors.whiteAccent,
                    fontSize: 12,
                    fontFamily: familyB,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class MuiTimeline extends StatelessWidget {
  const MuiTimeline({
    Key? key,
    required this.height,
    required this.progress,
  }) : super(key: key);
  final double height;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return MuiCard(
      heigth: height,
      width: 12,
      insetShadow: true,
      child: Align(
        alignment: Alignment.topCenter,
        child: MuiCard(
          width: 10,
          heigth: min((height - 2) * progress, (height - 2)),
          colorStart: const Color(0xFF4B3C50),
          colorEnd: const Color(0xFF9678A0),
          backgroundColor: const Color(0xFF775A81),
        ),
      ),
    );
  }
}

const _spacer = SizedBox(
  width: 20,
  height: 15,
);
