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
    required this.sectionW,
    required this.totalH,
  }) : super(key: key);
  final ScrollController controller;
  final int sections;
  final double sectionH;
  final double sectionW;
  final double totalH;

  @override
  State<SecondSection> createState() => _SecondSection();
}

class _SecondSection extends State<SecondSection> {
  double _top = 0;
  double _percent = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
  }

  void listener() {
    int pos = widget.controller.offset ~/ (widget.sectionH);
    if (pos < 1) {
      if (_top != 0 || _percent != 0) {
        setState(() {
          _top = 0;
          _percent = 0;
        });
      }
      return;
    }
    if (pos > 3) {
      return;
    }
    double p = widget.controller.offset - widget.sectionH * pos;
    setState(() {
      _top = min(p + (pos - 1) * widget.sectionH, widget.sectionH);
      _percent = _top / widget.sectionH;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 0),
          right: 0,
          left: 0,
          top: _top,
          child: SizedBox(
            width: widget.sectionW,
            height: widget.sectionH,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Builder(builder: (context) {
                var item1 = AnimatedOpacity(
                  opacity: min(1, _percent / 0.25 * 3),
                  duration: _duration,
                  curve: Curves.linear,
                  child: MuiTrayectoryVerticalCard(
                    active: _percent > 0.16,
                    insetShadow: _percent > 0.41,
                    icon: Icons.local_library_outlined,
                    title: "A-Levels",
                    location: "IPVCE Lenin, Havana",
                    time: "2009-2012",
                  ),
                );
                var item2 = AnimatedOpacity(
                  opacity: min(1, max(0, (_percent - 0.25) / 0.25 * 3)),
                  duration: _duration,
                  curve: Curves.ease,
                  child: MuiTrayectoryVerticalCard(
                    active: _percent > 0.41,
                    insetShadow: _percent > 0.66,
                    icon: Icons.book_outlined,
                    title: "2 years in CS",
                    location: "University of Havana, Havana",
                    time: "2013-2015",
                  ),
                );
                var item3 = AnimatedOpacity(
                  opacity: min(1, max(0, (_percent - 0.5) / 0.25 * 3)),
                  duration: _duration,
                  curve: Curves.ease,
                  child: MuiTrayectoryVerticalCard(
                    active: _percent > 0.66,
                    insetShadow: _percent > 0.84,
                    icon: Icons.school_outlined,
                    title: "HND Software Dev.",
                    location: "IES Saladillo, Algeciras",
                    time: "2020-2022",
                  ),
                );
                var item4 = AnimatedOpacity(
                  opacity: min(1, max(0, (_percent - 0.70) / 0.25 * 3)),
                  duration: _duration,
                  curve: Curves.ease,
                  child: MuiTrayectoryVerticalCard(
                    active: _percent > 0.84,
                    insetShadow: _percent > 0.98,
                    icon: Icons.important_devices_rounded,
                    title: "Fullstack Developer",
                    location: "Boorpret, Cádiz",
                    time: "2020-2022",
                  ),
                );
                if (widget.sectionW > 1000) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          item1,
                          item2,
                          item3,
                          item4,
                        ],
                      )),
                      MuiTimeline(
                        height: widget.sectionW - 60,
                        progress: _percent,
                        vertical: false,
                      ),
                      _spacer,
                      _spacer
                    ],
                  );
                }
                if (widget.sectionW > 500) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                item1,
                                item2,
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                item3,
                                item4,
                              ],
                            ),
                          ),
                        ],
                      )),
                      _spacer,
                      MuiTimeline(
                        height: widget.sectionW - 60,
                        progress: _percent,
                        vertical: false,
                      ),
                      _spacer
                    ],
                  );
                }
                return Row(
                  children: [
                    MuiTimeline(
                      height: widget.sectionH - 30,
                      progress: _percent,
                    ),
                    _spacer,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          item1,
                          item2,
                          item3,
                          item4,
                        ],
                      ),
                    )
                  ],
                );
              }),
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
    String familyA = "Montserrat";
    String familyB = "Comfortaa";

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

class MuiTrayectoryVerticalCard extends StatelessWidget {
  const MuiTrayectoryVerticalCard({
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
    String familyA = "Montserrat";
    String familyB = "Comfortaa";

    return MuiCard(
      heigth: 300,
      width: 220,
      active: active,
      insetShadow: insetShadow,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
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
                      fontSize: 22,
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
      ),
    );
  }
}

class MuiTimeline extends StatelessWidget {
  const MuiTimeline({
    Key? key,
    required this.height,
    required this.progress,
    this.vertical = true,
  }) : super(key: key);
  final double height;
  final double progress;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    return MuiCard(
      heigth: vertical ? height : 12,
      width: vertical ? 12 : height,
      insetShadow: true,
      child: Align(
        alignment: vertical ? Alignment.topCenter : Alignment.centerLeft,
        child: MuiCard(
          heigth: vertical ? min((height - 2) * progress, (height - 2)) : 10,
          width: vertical ? 10 : min((height - 2) * progress, (height - 2)),
          curve: Curves.linear,
          containerDuration: 0,
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

const _duration = Duration(milliseconds: 200);
