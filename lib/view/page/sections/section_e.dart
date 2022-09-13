import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';

class SectionFifth extends StatefulWidget {
  const SectionFifth({
    Key? key,
    required this.controller,
    required this.sectionH,
    required this.sections,
  }) : super(key: key);
  final ScrollController controller;
  final double sectionH;
  final int sections;

  @override
  State<SectionFifth> createState() => _SectionFifth();
}

class _SectionFifth extends State<SectionFifth> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: h,
      width: w,
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 4,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 40),
              child: AutoSizeText.rich(
                const TextSpan(text: "< I have always been ", children: [
                  TextSpan(
                    text: "HORIZONTALLY SCOPED ",
                    style: _accentStyle,
                  ),
                  TextSpan(
                      text:
                          "in regard to my abilities, and never had a specialised or well defined trade.\n\nFor the last 3 years I have worked very hard on"
                          " getting as good as I can in "),
                  TextSpan(
                    text: "SOFTWARE DEVELOPMENT",
                    style: _accentStyle,
                  ),
                  TextSpan(
                      text:
                          ", building a more vertically scoped profile in the field I love."
                          "\n\nI became to understand how mastering skills takes "),
                  TextSpan(
                    text: "TIME ",
                    style: _accentStyle,
                  ),
                  TextSpan(text: "and "),
                  TextSpan(
                    text: "DEDICATION",
                    style: _accentStyle,
                  ),
                  TextSpan(
                      text: ", but with the proper strategy, this journey "
                          "can be extremely fun and exciting. I learned to deal with impostor syndrome, to manage the overwhelming and "
                          "rapidly-blooming technologies, to overcome burnouts, to make the most out of my "),
                  TextSpan(
                    text: "PRODUCTIVITY PEAKS",
                    style: _accentStyle,
                  ),
                  TextSpan(
                      text:
                          ", and to push everyone working around me towards a better version of themselves."
                          "\n\nI am a supportive "),
                  TextSpan(
                    text: "TEAM PLAYER",
                    style: _accentStyle,
                  ),
                  TextSpan(text: ", very proactive and always with a "),
                  TextSpan(
                    text: "CAN-DO ",
                    style: _accentStyle,
                  ),
                  TextSpan(text: "attitude. For the past 5 years I had a "),
                  TextSpan(
                    text: "CONTINUOUS ",
                    style: _accentStyle,
                  ),
                  TextSpan(text: "improvement mindset as I strive to become "),
                  TextSpan(
                    text: "BETTER ",
                    style: _accentStyle,
                  ),
                  TextSpan(
                      text:
                          "everyday, reinforcing my lifelong learning eagerness."
                          "\n\nI now aspire to contribute to the community, increase my professional network and carry on following my "
                          "carefully tailored career pathway."
                          "\n\nStill horizontal, but propelling in "),
                  TextSpan(
                    text: "VERTICAL",
                    style: _accentStyle,
                  ),
                  TextSpan(text: " ./>"),
                ]),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 30,
                  // color: AppColors.whitePrimary,
                  color: Colors.white,
                  fontFamily: "Comfortaa",

                  shadows: [
                    for (int i = 1; i < 5; i++)
                      Shadow(color: AppColors.whiteAccent, blurRadius: i * 4)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 6,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: const ShapeDecoration(
                        color: Color(0xFF8a6c94), shape: StadiumBorder()),
                  ),
                ),
                AnimatedCubaStamp(
                    sectionHeight: widget.sectionH,
                    controller: widget.controller),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 6,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: const ShapeDecoration(
                        color: Color(0xFF8a6c94), shape: StadiumBorder()),
                  ),
                ),
              ],
            ),
          )
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
