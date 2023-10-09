import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:provider/provider.dart';
import 'package:ricardomejiastravieso/providers/device_provider.dart';
import 'package:ricardomejiastravieso/providers/theme_provider.dart';
import 'package:ricardomejiastravieso/utils/scroll_utils.dart';
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
    final isWebMobile =
        Provider.of<DeviceProvider>(context, listen: true).isWebMobile;
    // final shouldDisableTouchScroll = shouldDisableAllowScrolling(
    //                     context, Theme.of(context).platform);
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: LayoutBuilder(builder: (context, constraints) {
        final h = MediaQuery.of(context).size.height;
        final w = MediaQuery.of(context).size.width;
        const sections = 10;
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            // Layer que decora el fondo de la web con una imagen
            // en dependencia del theme.
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
            // Layer encargada de mostrar el contenido real de la web.
            SizedBox(
              height: h,
              width: w,
              child: ImprovedScrolling(
                scrollController: _controllerPrimary,
                enableCustomMouseWheelScrolling: !isWebMobile,
                customMouseWheelScrollConfig:
                    const CustomMouseWheelScrollConfig(
                  scrollAmountMultiplier: 10,
                  scrollDuration: Duration(milliseconds: 200),
                ),
                enableKeyboardScrolling: !isWebMobile,
                keyboardScrollConfig: const KeyboardScrollConfig(),
                child: ScrollConfiguration(
                  behavior:
                      const CustomScrollBehaviour().copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    controller: _controllerPrimary,
                    physics: !isWebMobile
                        ? const NeverScrollableScrollPhysics()
                        : const ClampingScrollPhysics(),
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
              ),
            ),
            // Layer encargada de posicionar los controladores de idioma
            // y theme.
            const Positioned(
                bottom: 5,
                left: 5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [MuiSwitchLang(), MuiSwitchTheme()],
                )),
            // Layer encargada de mostrar el custom cursor si está en web,
            // lo esconde si es mobile.
            SizedBox(
              height: h,
              width: w,
              child:
                  Provider.of<DeviceProvider>(context, listen: true).isWebMobile
                      ? null
                      : const CustomCursorLayer(),
            ),
            // Layer encargada de cargar en la cache todas las imágenes,
            // luego transiciona de 0xFF333333 al contenido real de la web.
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

class CustomScrollBehaviour extends MaterialScrollBehavior {
  const CustomScrollBehaviour();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };

  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    final platform = getPlatform(context);
    if (shouldDisableAllowScrolling(context, platform)) {
      return Scrollbar(
        controller: details.controller,
        thumbVisibility: false,
        interactive: true,
        child: child,
      );
    }
    return child;
  }
}
