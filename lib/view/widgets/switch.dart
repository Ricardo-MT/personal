import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';

class MuiSwitchTheme extends StatefulWidget {
  const MuiSwitchTheme({Key? key}) : super(key: key);

  @override
  State<MuiSwitchTheme> createState() => _MuiSwitchTheme();
}

class _MuiSwitchTheme extends State<MuiSwitchTheme> {
  late bool on;

  @override
  void initState() {
    super.initState();
    on = true;
  }

  void nextState() {
    setState(() {
      on = !on;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 54,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.nightlight_round,
                size: 20,
                color: AppColors.whitePrimary,
              ),
              Icon(
                Icons.wb_sunny_sharp,
                size: 20,
                color: AppColors.whitePrimary,
              ),
            ],
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: nextState,
              child: Container(
                height: 28,
                width: 50,
                decoration: ShapeDecoration(
                  shape: StadiumBorder(
                      side: BorderSide(color: AppColors.whitePrimary)),
                ),
                child: AnimatedAlign(
                  alignment: on ? Alignment.centerLeft : Alignment.centerRight,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: Container(
                      height: 24,
                      width: 26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whitePrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MuiSwitchLang extends StatefulWidget {
  const MuiSwitchLang({Key? key}) : super(key: key);

  @override
  State<MuiSwitchLang> createState() => _MuiSwitchLang();
}

class _MuiSwitchLang extends State<MuiSwitchLang> {
  late bool on;

  @override
  void initState() {
    super.initState();
    on = true;
  }

  void nextState() {
    setState(() {
      on = !on;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 54,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "EN",
                style: TextStyle(
                  color: AppColors.whitePrimary,
                  fontSize: 12,
                ),
              ),
              Text(
                "ES",
                style: TextStyle(
                  color: AppColors.whitePrimary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: nextState,
              child: Container(
                height: 28,
                width: 50,
                decoration: ShapeDecoration(
                  shape: StadiumBorder(
                      side: BorderSide(color: AppColors.whitePrimary)),
                ),
                child: AnimatedAlign(
                  alignment: on ? Alignment.centerLeft : Alignment.centerRight,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: Container(
                      height: 24,
                      width: 26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whitePrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
