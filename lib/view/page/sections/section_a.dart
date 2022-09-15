import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';

class SectionZero extends StatefulWidget {
  const SectionZero({
    Key? key,
    required this.controller,
    required this.sectionH,
    required this.sections,
  }) : super(key: key);
  final ScrollController controller;
  final double sectionH;
  final int sections;

  @override
  State<SectionZero> createState() => _SectionZero();
}

class _SectionZero extends State<SectionZero> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: h,
      width: w,
      child: Column(
        children: [
          // Expanded(
          //   child: Row(
          //     children: [
          //       const Spacer(
          //         flex: 4,
          //       ),
          //       AnimatedCubaStamp(
          //           sectionHeight: widget.sectionH,
          //           controller: widget.controller),
          //       const Spacer(
          //         flex: 1,
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            flex: 4,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 2,
                    // child: Image.asset("assets/images/cuba_a.png"),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: MuiCard(
                        circular: true,
                        insetShadow: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 3,
                    child: AutoSizeText.rich(
                      const TextSpan(text: "< I´m a Spain based ", children: [
                        TextSpan(
                          text: "FULLSTACK ",
                          style: _accentStyle,
                        ),
                        TextSpan(
                          text: "& ",
                        ),
                        TextSpan(
                          text: "MOBILE ",
                          style: _accentStyle,
                        ),
                        TextSpan(
                          text:
                              "software developer, with 3 years of intensive experience in building ",
                        ),
                        TextSpan(
                          text: "DIGITAL PRODUCTS ",
                          style: _accentStyle,
                        ),
                        TextSpan(
                            text:
                                "from the ground up, working closely with clients and managing small teams.\n\nI´ve also work in all phases of "),
                        TextSpan(
                          text: "PRODUCT DESIGN",
                          style: _accentStyle,
                        ),
                        TextSpan(
                            text:
                                ", from ideation and UX to high-fidelity UI and interactions."),
                        TextSpan(text: "\n\n I always strive for "),
                        TextSpan(
                          text: "SIMPLE ",
                          style: _accentStyle,
                        ),
                        TextSpan(
                          text: "and ",
                        ),
                        TextSpan(
                          text: "PRACTICAL ",
                          style: _accentStyle,
                        ),
                        TextSpan(text: "solutions in order to maximize the "),
                        TextSpan(
                          text: "RESULT",
                          style: _accentStyle,
                        ),
                        TextSpan(
                          text: " ./>",
                        ),
                      ]),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 30,
                        // color: AppColors.whitePrimary,
                        color: Colors.white,
                        fontFamily: "Comfortaa",
                        shadows: [
                          for (int i = 1; i < 3; i++)
                            Shadow(
                                color: AppColors.whiteAccent, blurRadius: i * 5)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const Spacer(
                  flex: 2,
                ),
                AnimatedCubaStamp(
                    sectionHeight: widget.sectionH,
                    controller: widget.controller),
                const Spacer(
                  flex: 4,
                ),
              ],
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
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}

const _accentStyle = TextStyle(
  fontFamily: "Montserrat",
  fontSize: 36,
  color: Color(0xFF8a6c94),
  shadows: [],
);
