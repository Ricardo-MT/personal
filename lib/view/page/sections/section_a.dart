import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theme.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';

class SectionZero extends StatelessWidget {
  const SectionZero({
    Key? key,
    required this.controller,
    required this.sectionH,
    required this.sectionW,
    required this.sections,
  }) : super(key: key);
  final ScrollController controller;
  final double sectionH;
  final double sectionW;
  final int sections;

  @override
  Widget build(BuildContext context) {
    bool isMobile = sectionW <= 900;
    var item2 = Expanded(
      flex: 5,
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
              Shadow(color: AppColors.whiteAccent, blurRadius: i * 5)
          ],
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
      child: isMobile
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: 240,
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: MuiCard(
                          circular: true,
                          insetShadow: true,
                          width: 300,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                item2,
              ],
            )
          : Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
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
                  item2,
                ],
              ),
            ),
    );
  }
}

const _accentStyle = TextStyle(
  fontFamily: "Montserrat",
  fontSize: 36,
  color: AppColors.lightPurple,
  shadows: [],
);
