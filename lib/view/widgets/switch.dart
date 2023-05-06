import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricardomejiastravieso/providers/locale_provider.dart';
import 'package:ricardomejiastravieso/providers/theme_provider.dart';

class MuiSwitchTheme extends StatelessWidget {
  const MuiSwitchTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        double bottom = provider.mode == ThemeMode.light ? 0 : -30;
        var color = Theme.of(context).colorScheme.primary;
        return SizedBox(
          height: 30,
          width: 30,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: provider.toggleThemeMode,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    bottom: bottom,
                    child: SizedBox(
                      width: 30,
                      height: 60,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.nightlight_round,
                              size: 20,
                              color: color,
                            ),
                            Icon(
                              Icons.wb_sunny_sharp,
                              size: 20,
                              color: color,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
    var color = Theme.of(context).colorScheme.primary;
    return Consumer<LocaleProvider>(
      builder: (context, provider, child) {
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
                      color: color,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "ES",
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: Provider.of<LocaleProvider>(context, listen: false)
                      .toggleLocale,
                  child: Container(
                    height: 28,
                    width: 50,
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(
                          side: BorderSide(
                        color: color,
                      )),
                    ),
                    child: AnimatedAlign(
                      alignment: provider.locale.languageCode == 'es'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 1),
                        child: Container(
                          height: 24,
                          width: 26,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
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
      },
    );
  }
}
