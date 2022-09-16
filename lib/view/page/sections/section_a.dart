import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theme.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';
import 'package:ricardomejiastravieso/l10n/l10n.dart';

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
    final l10n = context.l10n;
    bool isMobile = sectionW <= 900;
    var item2 = Expanded(
      flex: 5,
      child: AutoSizeText.rich(
        TextSpan(text: l10n.sectionA1, children: [
          const TextSpan(
            text: "FULLSTACK ",
            style: _accentStyle,
          ),
          const TextSpan(
            text: "& ",
          ),
          const TextSpan(
            text: "MOBILE ",
            style: _accentStyle,
          ),
          TextSpan(
            text: l10n.sectionA2,
          ),
          TextSpan(
            text: l10n.sectionA3,
            style: _accentStyle,
          ),
          TextSpan(text: l10n.sectionA4),
          TextSpan(
            text: l10n.sectionA5,
            style: _accentStyle,
          ),
          TextSpan(text: l10n.sectionA6),
          TextSpan(text: l10n.sectionA7),
          TextSpan(
            text: l10n.sectionA8,
            style: _accentStyle,
          ),
          TextSpan(
            text: l10n.sectionA9,
          ),
          TextSpan(
            text: l10n.sectionA10,
            style: _accentStyle,
          ),
          TextSpan(text: l10n.sectionA11),
          TextSpan(
            text: l10n.sectionA12,
            style: _accentStyle,
          ),
          TextSpan(
            text: l10n.sectionA13,
          ),
        ]),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
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
                          width: 240,
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
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/me.png",
                                  ),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                )),
                          ),
                        ),
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
