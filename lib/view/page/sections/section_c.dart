import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';
import 'package:ricardomejiastravieso/view/widgets/custom_icons_icons.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({
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
  Widget build(BuildContext context) {
    bool isMobile = sectionW < 630;
    return RepaintBoundary(
      child: SizedBox(
        height: sectionH,
        width: sectionW,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
              techSections.length,
              (index) => isMobile
                  ? MuiSectionVerticalWidget(
                      controller: controller,
                      section: techSections[index],
                      sectionH: sectionH,
                      index: index,
                    )
                  : MuiSectionWidget(
                      controller: controller,
                      section: techSections[index],
                      sectionH: sectionH,
                      index: index,
                      inverted: index % 2 != 0,
                    )),
        ),
      ),
    );
  }
}

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 150, 120, 160),
    Color.fromARGB(255, 120, 89, 130)
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 60.0));

class MuiSectionVerticalWidget extends StatefulWidget {
  const MuiSectionVerticalWidget({
    Key? key,
    required this.section,
    required this.sectionH,
    required this.index,
    required this.controller,
  }) : super(key: key);
  final MuiSection section;
  final double sectionH;
  final int index;
  final ScrollController controller;

  @override
  State<MuiSectionVerticalWidget> createState() =>
      _MuiSectionVerticalWidgetState();
}

class _MuiSectionVerticalWidgetState extends State<MuiSectionVerticalWidget> {
  late bool active;

  @override
  void initState() {
    super.initState();
    active = false;
    widget.controller.addListener(listener);
  }

  void listener() {
    int pos = widget.controller.offset ~/ (widget.sectionH);
    if (pos != 3) {
      return;
    }
    var opacityPercent =
        min(1, (widget.controller.offset / (widget.sectionH * 1)) - 3);
    var localActive =
        opacityPercent >= ((1 / techSections.length) * widget.index + 0.32);
    if (active != localActive) {
      setState(() {
        active = localActive;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12).copyWith(
              top: 0,
              bottom: 6,
            ),
            child: SizedBox(
              width: 300,
              child: Align(
                alignment: widget.section.alignment,
                child: MuiSectionTitle(
                  title: widget.section.title,
                  alignment: getAlignment(widget.section.alignment),
                  active: active,
                ),
              ),
            ),
          ),
          MuiCard(
            insetShadow: active,
            active: active,
            width: 300,
            heigth: 126,
            decorated: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.spaceEvenly,
                  children: List.generate(
                      widget.section.skills.length,
                      (index) => MuiSkillItem(
                            skill: widget.section.skills[index],
                            active: active,
                            isMobile: true,
                          )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MuiSectionWidget extends StatefulWidget {
  const MuiSectionWidget({
    Key? key,
    required this.section,
    required this.sectionH,
    required this.index,
    required this.controller,
    this.inverted = false,
  }) : super(key: key);
  final bool inverted;
  final MuiSection section;
  final double sectionH;
  final int index;
  final ScrollController controller;

  @override
  State<MuiSectionWidget> createState() => _MuiSectionWidgetState();
}

class _MuiSectionWidgetState extends State<MuiSectionWidget> {
  late bool active;

  @override
  void initState() {
    super.initState();
    active = false;
    widget.controller.addListener(listener);
  }

  void listener() {
    int pos = widget.controller.offset ~/ (widget.sectionH);
    if (pos != 3) {
      return;
    }
    var opacityPercent =
        min(1, (widget.controller.offset / (widget.sectionH * 1)) - 3);
    var localActive =
        opacityPercent >= ((1 / techSections.length) * widget.index + 0.32);
    if (active != localActive) {
      setState(() {
        active = localActive;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(
        child: Center(
          child: MuiSectionTitle(
            title: widget.section.title,
            alignment: TextAlign.center,
            active: active,
            isMobile: false,
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.loose,
        child: Center(
          child: MuiCard(
            insetShadow: active,
            active: active,
            width: 386,
            heigth: 240,
            decorated: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              child: Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.spaceEvenly,
                children: List.generate(
                    widget.section.skills.length,
                    (index) => MuiSkillItem(
                          skill: widget.section.skills[index],
                          active: active,
                        )),
              ),
            ),
          ),
        ),
      )
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.inverted ? children.reversed.toList() : children,
      ),
    );
  }
}

class MuiSkillItem extends StatelessWidget {
  const MuiSkillItem({
    Key? key,
    required this.skill,
    required this.active,
    this.isMobile = false,
  }) : super(key: key);
  final Skill skill;
  final bool active;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      switchInCurve: Curves.fastOutSlowIn,
      child: active
          ? Row(
              key: Key('animatedSwitchedIconOn${skill.name}'),
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: isMobile ? 22 : 32,
                    width: isMobile ? 30 : 42,
                    child: Center(
                        child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 1000),
                      switchInCurve: Curves.fastOutSlowIn,
                      child: Icon(
                        skill.icon,
                        color: skill.color,
                        size: isMobile ? 22 : 30,
                        shadows: [
                          for (int i = 1; i < 5; i++)
                            Shadow(
                                color: (skill.color ?? AppColors.whiteAccent)
                                    .withOpacity(0.6),
                                blurRadius: (8 * i).toDouble())
                        ],
                      ),
                    ))),
                SizedBox(
                  height: isMobile ? 22 : 32,
                  width: isMobile ? 100 : 136,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      skill.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 14 : 20,
                        fontFamily: "Comfortaa",
                        shadows: [
                          for (int i = 1; i < 6; i++)
                            Shadow(
                                color: AppColors.whiteAccent.withOpacity(0.8),
                                blurRadius: (5 * i).toDouble())
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          : Row(
              key: Key('animatedSwitchedIconOff${skill.name}'),
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: isMobile ? 22 : 32,
                    width: isMobile ? 30 : 42,
                    child: Center(
                        child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 1000),
                            switchInCurve: Curves.fastOutSlowIn,
                            child: Icon(
                              key: Key('animatedSwitchedIconOff${skill.name}'),
                              skill.icon,
                              color: skill.color?.withOpacity(0.6),
                              size: isMobile ? 20 : 28,
                              shadows: const [],
                            )))),
                SizedBox(
                  height: isMobile ? 22 : 32,
                  width: isMobile ? 100 : 136,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      skill.name,
                      style: TextStyle(
                        color: AppColors.whiteAccent,
                        fontSize: isMobile ? 14 : 20,
                        fontFamily: "Comfortaa",
                        shadows: const [],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

class MuiSectionTitle extends StatelessWidget {
  const MuiSectionTitle({
    Key? key,
    required this.title,
    this.active = false,
    this.isMobile = false,
    required this.alignment,
  }) : super(key: key);
  final String title;
  final bool active;
  final TextAlign alignment;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      child: Text(
        key: Key('animatedNeonTitle$title$active'),
        title,
        textAlign: alignment,
        style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 16 : 24,
            fontFamily: "Monoton",
            shadows: active
                ? [
                    for (int i = 1; i < 6; i++)
                      Shadow(
                          color: AppColors.whiteAccent.withOpacity(0.8),
                          blurRadius: (5 * i).toDouble())
                  ]
                : []),
      ),
    );
  }
}

TextAlign getAlignment(Alignment alignment) {
  if (alignment == Alignment.centerLeft) {
    return TextAlign.left;
  }
  if (alignment == Alignment.centerRight) {
    return TextAlign.right;
  }
  return TextAlign.center;
}

List<MuiSection> techSections = [
  MuiSection(
    title: "PROGRAMMING\nLANGUAGES",
    alignment: Alignment.centerLeft,
    skills: [
      Skill(
          icon: CustomIcons.dart, name: "Dart", color: const Color(0xFF0175C2)),
      Skill(
          icon: CustomIcons.java, name: "Java", color: const Color(0xFFED2126)),
      Skill(
          icon: CustomIcons.javascript,
          name: "Javascript",
          color: const Color(0xFFF7DF1E)),
      Skill(
          icon: CustomIcons.typescript,
          name: "Typescript",
          color: const Color(0xFF3178C6)),
      Skill(
          icon: CustomIcons.csharp, name: "C#", color: const Color(0xFF6264A7)),
      Skill(
          icon: CustomIcons.kotlin,
          name: "Kotlin",
          color: const Color(0xFF7F52FF)),
      Skill(icon: CustomIcons.php, name: "PHP", color: const Color(0xFF00D8FF)),
    ],
  ),
  MuiSection(
    title: "Frameworks\n& libraries",
    alignment: Alignment.center,
    skills: [
      Skill(
          icon: CustomIcons.flutter,
          name: "Flutter",
          color: const Color(0xFF02569B)),
      Skill(
          icon: CustomIcons.react,
          name: "React Native",
          color: const Color(0xFF61DAFB)),
      Skill(
          icon: CustomIcons.react,
          name: "React",
          color: const Color(0xFF0088CC)),
      Skill(
          icon: CustomIcons.android,
          name: "Android",
          color: const Color(0xFF3DDC84)),
      Skill(
          icon: FontAwesomeIcons.node,
          name: "Node",
          color: const Color(0xFF339933)),
    ],
  ),
  MuiSection(
    title: "Other\ntech",
    alignment: Alignment.centerRight,
    skills: [
      Skill(
          icon: CustomIcons.html5,
          name: "HTML",
          color: const Color(0xFFE34F26)),
      Skill(
          icon: CustomIcons.css3, name: "CSS", color: const Color(0xFF1572B6)),
      Skill(
          icon: CustomIcons.mongodb,
          name: "Mongo",
          color: const Color(0xFF47A248)),
      Skill(
          icon: CustomIcons.mysql,
          name: "MySQL",
          color: const Color(0xFF4479A1)),
      Skill(
          icon: CustomIcons.firebase,
          name: "Firebase",
          color: const Color(0xFFFFCA28)),
    ],
  ),
];

class MuiSection {
  MuiSection({
    required this.title,
    required this.skills,
    required this.alignment,
  });
  String title;
  List<Skill> skills;
  Alignment alignment;
}

class Skill {
  Skill({
    required this.icon,
    required this.name,
    this.color,
  });
  IconData icon;
  String name;
  Color? color;
}

List<Skill> skills = [
  // PROGRAMMING LANGUAGES
  // FRAMEWORKS
  // OTHER TECH
  // DEV TOOLS
  // Skill(
  //     icon: CustomIcons.github, name: "GitHub", color: const Color(0xFF800080)),
  // Skill(
  //     icon: CustomIcons.digitalocean,
  //     name: "Dig.Ocean",
  //     color: const Color(0xFF0080FF)),
  // Skill(icon: CustomIcons.ionos, name: "IONOS", color: const Color(0xFF003D8F)),
  // Skill(
  //     icon: CustomIcons.visualstudiocode,
  //     name: "VSCode",
  //     color: const Color(0xFF007ACC)),
  // Skill(icon: CustomIcons.xcode, name: "XCode", color: const Color(0xFF147EFB)),
  // Skill(
  //     icon: CustomIcons.postman,
  //     name: "Postman",
  //     color: const Color(0xFFFF6C37)),
  // Skill(
  //     icon: CustomIcons.adobexd,
  //     name: "AdobeXD",
  //     color: const Color(0xFFFF61F6)),
  // Skill(icon: CustomIcons.figma, name: "Figma", color: const Color(0xFFF24E1E)),
  // TEAM & MANAGEMENT
  // Skill(
  //     icon: CustomIcons.clickup,
  //     name: "Clickup",
  //     color: const Color(0xFF7B68EE)),
  // Skill(icon: CustomIcons.slack, name: "Slack", color: const Color(0xFF4A154B)),
  // Skill(
  //     icon: CustomIcons.microsoftteams,
  //     name: "Teams",
  //     color: const Color(0xFF6264A7)),
  // Skill(
  //     icon: CustomIcons.discord,
  //     name: "Discord",
  //     color: const Color(0xFF5865F2)),
  // Skill(icon: CustomIcons.skype, name: "Skype", color: const Color(0xFF00AFF0)),
];
