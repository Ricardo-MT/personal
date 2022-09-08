import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';
import 'package:ricardomejiastravieso/view/widgets/custom_icons_icons.dart';

class ThirdSection extends StatefulWidget {
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
  State<ThirdSection> createState() => _ThirdSection();
}

class _ThirdSection extends State<ThirdSection> {
  double _top = 0;
  double _percent = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
  }

  void listener() {
    int pos = widget.controller.offset ~/ (widget.sectionH);
    if (pos < 3) {
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
      _top = min(p, widget.sectionH);
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
    return RepaintBoundary(
      child: Stack(
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
                  return Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: List.generate(
                        skills.length,
                        (index) => MuiSkillItem(
                              skill: skills[index],
                              active: _percent > index / skills.length,
                            )),
                  );
                }),
              ),
            ),
          )
        ],
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

class MuiSkillItem extends StatelessWidget {
  const MuiSkillItem({
    Key? key,
    required this.skill,
    required this.active,
  }) : super(key: key);
  final Skill skill;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 50,
            width: 50,
            child: Center(
                child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              switchInCurve: Curves.fastOutSlowIn,
              child: active
                  ? Icon(
                      key: Key('animatedSwitchedIconOn${skill.name}'),
                      skill.icon,
                      color: skill.color,
                      size: 40,
                      shadows: [
                        for (int i = 1; i < 5; i++)
                          Shadow(
                              color: (skill.color ?? AppColors.whiteAccent)
                                  .withOpacity(0.6),
                              blurRadius: (8 * i).toDouble())
                      ],
                    )
                  : Icon(
                      key: Key('animatedSwitchedIconOff${skill.name}'),
                      skill.icon,
                      color: skill.color?.withOpacity(0.6),
                      size: 40,
                      shadows: const [],
                    ),
            ))),
        SizedBox(
          height: 50,
          width: 200,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              skill.name,
              style: TextStyle(
                color: AppColors.whiteAccent,
                fontSize: 22,
                fontFamily: "Comfortaa",
              ),
            ),
          ),
        )
      ],
    );
  }
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
  Skill(icon: CustomIcons.dart, name: "Dart", color: const Color(0xFF0175C2)),
  Skill(icon: CustomIcons.java, name: "Java", color: const Color(0xFFED2126)),
  Skill(
      icon: CustomIcons.javascript,
      name: "Javascript",
      color: const Color(0xFFF7DF1E)),
  Skill(
      icon: CustomIcons.typescript,
      name: "Typescript",
      color: const Color(0xFF3178C6)),
  Skill(icon: CustomIcons.csharp, name: "C#", color: const Color(0xFF6264A7)),
  Skill(
      icon: CustomIcons.kotlin, name: "Kotlin", color: const Color(0xFF7F52FF)),
  Skill(icon: CustomIcons.php, name: "PHP", color: const Color(0xFF00D8FF)),
  // FRAMEWORKS
  Skill(
      icon: CustomIcons.flutter,
      name: "Flutter",
      color: const Color(0xFF02569B)),
  Skill(
      icon: CustomIcons.react,
      name: "React Native",
      color: const Color(0xFF61DAFB)),
  Skill(icon: CustomIcons.react, name: "React", color: const Color(0xFF0088CC)),
  Skill(
      icon: FontAwesomeIcons.node,
      name: "Node",
      color: const Color(0xFF339933)),
  // OTHER TECH
  Skill(icon: CustomIcons.html5, name: "HTML", color: const Color(0xFFE34F26)),
  Skill(icon: CustomIcons.css3, name: "CSS", color: const Color(0xFF1572B6)),
  Skill(
      icon: CustomIcons.mongodb,
      name: "MongoDB",
      color: const Color(0xFF47A248)),
  Skill(icon: CustomIcons.mysql, name: "MySQL", color: const Color(0xFF4479A1)),
  Skill(
      icon: CustomIcons.firebase,
      name: "Firebase",
      color: const Color(0xFFFFCA28)),
  // DEV TOOLS
  Skill(
      icon: CustomIcons.github, name: "GitHub", color: const Color(0xFF800080)),
  Skill(
      icon: CustomIcons.digitalocean,
      name: "Digital Ocean",
      color: const Color(0xFF0080FF)),
  Skill(icon: CustomIcons.ionos, name: "IONOS", color: const Color(0xFF003D8F)),
  Skill(
      icon: CustomIcons.visualstudiocode,
      name: "VSCode",
      color: const Color(0xFF007ACC)),
  Skill(icon: CustomIcons.xcode, name: "XCode", color: const Color(0xFF147EFB)),
  Skill(
      icon: CustomIcons.android,
      name: "Android Studio",
      color: const Color(0xFF3DDC84)),
  Skill(
      icon: CustomIcons.postman,
      name: "Postman",
      color: const Color(0xFFFF6C37)),
  Skill(
      icon: CustomIcons.adobexd,
      name: "AdobeXD",
      color: const Color(0xFFFF61F6)),
  Skill(icon: CustomIcons.figma, name: "Figma", color: const Color(0xFFF24E1E)),
  // TEAM & MANAGEMENT
  Skill(
      icon: CustomIcons.clickup,
      name: "Clickup",
      color: const Color(0xFF7B68EE)),
  Skill(icon: CustomIcons.slack, name: "Slack", color: const Color(0xFF4A154B)),
  Skill(
      icon: CustomIcons.microsoftteams,
      name: "Microsoft Teams",
      color: const Color(0xFF6264A7)),
  Skill(
      icon: CustomIcons.discord,
      name: "Discord",
      color: const Color(0xFF5865F2)),
  Skill(icon: CustomIcons.skype, name: "Skype", color: const Color(0xFF00AFF0)),
];
