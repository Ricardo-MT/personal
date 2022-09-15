import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';
import 'package:ricardomejiastravieso/view/widgets/animated_icon/animated_icon.dart';
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
          const Spacer(),
          const Spacer(
            flex: 4,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: MuiCard(
                    insetShadow: true,
                    width: (_spacer.height ?? 1) * 2 + 40,
                    heigth: (_spacer.height ?? 1) * 5 + 160,
                    child: Column(
                      children: [
                        _spacer,
                        MuiBadge(
                          size: 40,
                          child: Icon(
                            Icons.facebook,
                            color: AppColors.whitePrimary,
                            size: 18,
                          ),
                        ),
                        _spacer,
                        MuiBadge(
                          size: 40,
                          child: Icon(
                            Icons.whatsapp,
                            color: AppColors.whitePrimary,
                            size: 18,
                          ),
                        ),
                        _spacer,
                        MuiBadge(
                          size: 40,
                          child: Icon(
                            Icons.email,
                            color: AppColors.whitePrimary,
                            size: 18,
                          ),
                        ),
                        _spacer,
                        MuiBadge(
                          size: 40,
                          child: Icon(
                            Icons.link_outlined,
                            color: AppColors.whitePrimary,
                            size: 18,
                          ),
                        ),
                        _spacer,
                      ],
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => widget.controller.animateTo(0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn),
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: MuiAnimatedIcon(),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: kToolbarHeight * 1.5,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 150, 120, 160),
                Color.fromARGB(255, 120, 89, 130)
              ],
            )),
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/Icon-192.png",
                    width: 40,
                    height: 40,
                    color: AppColors.whitePrimary,
                  ),
                  // Text(
                  //   "Ricardo",
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontFamily: "Comfortaa",
                  //     color: AppColors.whitePrimary,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xFF333333),
            height: widget.sectionH * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Ricardo Mejías Travieso",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF8A6C94)),
                          ),
                          Text(
                            "Fulstack & Mobile Developer",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF8A6C94)),
                          ),
                          Text(
                            "Cádiz, España",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF8A6C94)),
                          ),
                          Text(
                            "+34 644 096889",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF8A6C94)),
                          ),
                          Text(
                            "rikr2.mt@gmail.com",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xFF8A6C94)),
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
            color: const Color(0xFF333333),
            height: kToolbarHeight * 1.5,
            // decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Color.fromARGB(255, 113, 84, 123),
            //     Color.fromARGB(255, 69, 47, 76),
            //   ],
            // )),
            child: Center(
              child: Text(
                "©2022 RICARDO MEJIAS TRAVIESO\nPOWERED WITH FLUTTER",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12,
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

const _spacer = SizedBox(height: 10);
