import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/l10n/l10n.dart';
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
    final l10n = context.l10n;
    bool isMobile = sectionW <= 900;
    var item2 = Expanded(
      flex: 5,
      child: AutoSizeText.rich(
        TextSpan(text: l10n.sectionA1, children: [
          TextSpan(
            text: "FULL STACK ",
            style: _accentStyle,
          ),
          const TextSpan(
            text: "& ",
          ),
          TextSpan(
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
        textAlign: isMobile ? TextAlign.left : TextAlign.right,
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
                const SizedBox(
                  width: 240,
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: MuiCard(
                        circular: true,
                        insetShadow: true,
                        width: 240,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/abajo.png",
                                ),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              )),
                        ),
                      )),
                ),
                const SizedBox(
                  width: 15,
                ),
                item2,
              ],
            )
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MuiCard(
                      circular: true,
                      insetShadow: false,
                      width: 240,
                      heigth: 240,
                      child: RepaintBoundary(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/abajo.png",
                                ),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              )),
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
            ),
    );
  }
}

final _accentStyle = TextStyle(
  color: AppColors.lightPurple,
  shadows: [
    for (int i = 1; i < 3; i++)
      Shadow(color: AppColors.lightPurple, blurRadius: i * 5)
  ],
);
