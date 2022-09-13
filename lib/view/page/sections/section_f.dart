import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';

class SectionLast extends StatefulWidget {
  const SectionLast({
    Key? key,
    required this.controller,
    required this.sectionH,
    required this.sections,
  }) : super(key: key);
  final ScrollController controller;
  final double sectionH;
  final int sections;

  @override
  State<SectionLast> createState() => _SectionLast();
}

class _SectionLast extends State<SectionLast> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: h,
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: kToolbarHeight,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 150, 120, 160),
                Color.fromARGB(255, 120, 89, 130)
              ],
            )),
          ),
          const Spacer(),
          const Spacer(
            flex: 4,
          ),
          const Spacer(),
          Container(
            height: widget.sectionH * 0.25,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 113, 84, 123),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "YOU CAN FIND ME HERE",
                              style: TextStyle(
                                color: AppColors.whitePrimary,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                          ),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              MuiBadge(
                                child: Icon(
                                  Icons.facebook,
                                  color: AppColors.whitePrimary,
                                ),
                              ),
                              MuiBadge(
                                child: Icon(
                                  Icons.whatsapp,
                                  color: AppColors.whitePrimary,
                                ),
                              ),
                              MuiBadge(
                                child: Icon(
                                  Icons.email,
                                  color: AppColors.whitePrimary,
                                ),
                              ),
                              MuiBadge(
                                child: Icon(
                                  Icons.link_outlined,
                                  color: AppColors.whitePrimary,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Ricardo Mejías Travieso",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                          Text(
                            "Fulstack & Mobile Developer",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                          Text(
                            "Cádiz, España",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                          Text(
                            "+34 644 096889",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                          Text(
                            "rikr2.mt@gmail.com",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.whiteAccent,
                AppColors.whitePrimary,
              ],
            )),
          ),
          Container(
            height: kToolbarHeight * 1.5,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 113, 84, 123),
                Color.fromARGB(255, 69, 47, 76),
              ],
            )),
            child: Center(
              child: Text(
                "©2022 RICARDO MEJIAS TRAVIESO. - ALL RIGHTS RESERVED",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: AppColors.whitePrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCubaStamp extends StatefulWidget {
  const AnimatedCubaStamp({
    Key? key,
    required this.sectionHeight,
    required this.controller,
  }) : super(key: key);
  final double sectionHeight;
  final ScrollController controller;

  @override
  State<AnimatedCubaStamp> createState() => _AnimatedCubaStampState();
}

class _AnimatedCubaStampState extends State<AnimatedCubaStamp> {
  double turns = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
  }

  void listener() {
    int pos = widget.controller.offset ~/ (widget.sectionHeight);
    double p = widget.controller.offset - widget.sectionHeight * pos;

    setState(() {
      turns = pos + p / widget.sectionHeight;
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
      key: const Key("BACKGROUND_CUBA_STAMP"),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AnimatedRotation(
          turns: turns,
          curve: Curves.elasticOut,
          duration: const Duration(milliseconds: 3000),
          child: Image.asset(
            "assets/images/cuba_a.png",
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}

const _accentStyle = TextStyle(
  fontFamily: "Montserrat",
  fontSize: 40,
  color: Color(0xFF8a6c94),
  shadows: [],
);
