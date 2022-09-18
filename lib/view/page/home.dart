// ignore_for_file: non_constant_identifier_names

// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:ricardomejiastravieso/providers/theme_provider.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_a.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_b.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_c.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_d.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_e.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_f.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_newmorphism.dart';
import 'package:ricardomejiastravieso/view/widgets/custom_cursor.dart';
import 'package:ricardomejiastravieso/view/widgets/fade_out.dart';
import 'package:ricardomejiastravieso/view/widgets/switch.dart';

final _controllerPrimary = ScrollController();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: LayoutBuilder(builder: (context, constraints) {
        final h = MediaQuery.of(context).size.height;
        final w = MediaQuery.of(context).size.width;
        const sections = 10;
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                    Provider.of<ThemeProvider>(context, listen: true).mode ==
                            ThemeMode.light
                        ? "assets/backLight.png"
                        : "assets/back.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )),
              child: SizedBox(
                height: h,
                width: w,
              ),
            ),
            SizedBox(
              height: h,
              width: w,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _controllerPrimary,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: h,
                      width: w,
                      child: SectionInitialNewmorphism(
                        sections: sections,
                        controller: _controllerPrimary,
                        sectionH: h,
                        sectionW: w,
                        totalH: h * (sections - 1),
                      ),
                    ),
                    SizedBox(
                      height: h,
                      width: w,
                      child: SectionZero(
                        sections: sections,
                        controller: _controllerPrimary,
                        sectionH: h,
                        sectionW: w,
                      ),
                    ),
                    SizedBox(
                      height: 2 * h,
                      width: w,
                      child: SecondSection(
                        controller: _controllerPrimary,
                        sections: sections,
                        sectionH: h,
                        sectionW: w,
                        totalH: h * (sections - 1),
                      ),
                    ),
                    SizedBox(
                      height: h,
                      width: w,
                      child: ThirdSection(
                        controller: _controllerPrimary,
                        sections: sections,
                        sectionH: h,
                        sectionW: w,
                        totalH: h * (sections - 1),
                      ),
                    ),
                    SectionFourth(
                      sections: sections,
                      sectionH: h,
                      sectionW: w,
                      totalH: h * sections - 1,
                    ),
                    SizedBox(
                      height: h,
                      width: w,
                      child: SectionFifth(
                        sections: sections,
                        sectionH: h,
                        controller: _controllerPrimary,
                      ),
                    ),
                    SizedBox(
                      height: h,
                      width: w,
                      child: SectionLast(
                        sections: sections,
                        sectionH: h,
                        controller: _controllerPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 5,
                left: 5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [MuiSwitchLang(), MuiSwitchTheme()],
                )),
            SizedBox(
              height: h,
              width: w,
              child: const CustomCursorLayer(),
            ),
            FadeOutLayer(
              child: Container(
                width: w,
                height: h,
                decoration: const BoxDecoration(color: Color(0xFF333333)),
              ),
            )
          ],
        );
      }),
    );
  }
}
