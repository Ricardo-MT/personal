import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/l10n/l10n.dart';
import 'package:ricardomejiastravieso/utils/theme.dart';

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
    final l10n = context.l10n;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: h,
      width: w,
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 6,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
              child: AutoSizeText.rich(
                TextSpan(text: l10n.sectionE1, children: [
                  TextSpan(
                    text: l10n.sectionE2,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE3),
                  TextSpan(
                    text: l10n.sectionE4,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE5),
                  TextSpan(
                    text: l10n.sectionE6,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE7),
                  TextSpan(
                    text: l10n.sectionE8,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE9),
                  TextSpan(
                    text: l10n.sectionE10,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE11),
                  TextSpan(
                    text: l10n.sectionE12,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE13),
                  TextSpan(
                    text: l10n.sectionE14,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE15),
                  TextSpan(
                    text: l10n.sectionE16,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE17),
                  TextSpan(
                    text: l10n.sectionE18,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE19),
                  TextSpan(
                    text: l10n.sectionE20,
                    style: _accentStyle,
                  ),
                  TextSpan(text: l10n.sectionE21),
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
            ),
          ),
          const Spacer()
        ],
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
