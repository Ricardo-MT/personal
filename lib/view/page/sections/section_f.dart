import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ricardomejiastravieso/utils/api_launch.dart';
import 'package:ricardomejiastravieso/utils/theme.dart';
import 'package:ricardomejiastravieso/view/widgets/animated_icon/animated_icon.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';
import 'package:seo_renderer/renderers/link_renderer/link_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:url_launcher/link.dart';

class SectionLast extends StatefulWidget {
  const SectionLast({
    Key? key,
    required this.controller,
    required this.sectionH,
    required this.sections,
  }) : super(key: key);
  final ScrollController controller;
  final double sectionH;
  final int sections;

  @override
  State<SectionLast> createState() => _SectionLast();
}

class _SectionLast extends State<SectionLast> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: h,
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Stack(
            children: [
              Center(
                child: MuiCard(
                  circular: true,
                  width: 300,
                  heigth: 300,
                  child: Transform.scale(
                    scaleX: -1,
                    child: RepaintBoundary(
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/arriba.png",
                              ),
                              // colorFilter: ColorFilter.mode(
                              //   Theme.of(context).colorScheme.onPrimary,
                              //   BlendMode.hue,
                              // ),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: MuiCard(
                          width: 60,
                          heigth: 10 * (contacItems.length + 1) +
                              contacItems.length * 40,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                List.generate(contacItems.length, (index) {
                              var item = contacItems[index];
                              return LinkRenderer(
                                href: item.url,
                                text: item.url,
                                child: Link(
                                  uri: Uri.parse(item.url),
                                  builder: (BuildContext context,
                                      Future<void> Function()? followLink) {
                                    return GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () => ApiLaunch.launch(item.url),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: MuiBadge(
                                          size: 40,
                                          child: Icon(
                                            item.icon,
                                            color: AppColors.whitePrimary,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => widget.controller.animateTo(0,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn),
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: MuiAnimatedIcon(),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
          Container(
            height: kToolbarHeight * 1.2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 150, 120, 160),
                Color.fromARGB(255, 120, 89, 130)
              ],
            )),
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/Icon-192.png",
                    width: 40,
                    height: 40,
                    color: AppColors.whitePrimary,
                  ),
                ],
              ),
            ),
          ),
          DecoratedBox(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Semantics(
                        label: "Ricardo Mejías Travieso",
                        hint: "Ricardo Mejías Travieso",
                        value: "Ricardo Mejías Travieso",
                        child: const TextRenderer(
                          child: SelectableText(
                            "Ricardo Mejías Travieso",
                            textAlign: TextAlign.right,
                            style: _contactStyle,
                          ),
                        ),
                      ),
                      _spacer,
                      Semantics(
                        label: "Fulstack & Mobile Developer",
                        hint: "Fulstack & Mobile Developer",
                        value: "Fulstack & Mobile Developer",
                        child: const TextRenderer(
                          child: SelectableText(
                            "Fulstack & Mobile Developer",
                            textAlign: TextAlign.right,
                            style: _contactStyle,
                          ),
                        ),
                      ),
                      _spacer,
                      Semantics(
                        label: "Cádiz, España",
                        hint: "Cádiz, España",
                        value: "Cádiz, España",
                        child: const TextRenderer(
                          child: SelectableText(
                            "Cádiz, España",
                            textAlign: TextAlign.right,
                            style: _contactStyle,
                          ),
                        ),
                      ),
                      _spacer,
                      const SelectableText(
                        "+34 644 096889",
                        textAlign: TextAlign.right,
                        style: _contactStyle,
                      ),
                      _spacer,
                      Semantics(
                        label: "rikr2.mt@gmail.com",
                        hint: "rikr2.mt@gmail.com",
                        value: "rikr2.mt@gmail.com",
                        child: const SelectableText(
                          "rikr2.mt@gmail.com",
                          textAlign: TextAlign.right,
                          style: _contactStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.whiteAccent,
                AppColors.whitePrimary,
              ],
            )),
          ),
          Container(
            color: Theme.of(context).colorScheme.onPrimary,
            height: kToolbarHeight * 1.3,
            child: Center(
              child: TextRenderer(
                child: Text(
                  "©2023 RICARDO MEJIAS TRAVIESO\nPOWERED WITH FLUTTER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<ContactItem> contacItems = [
  // linkedin://in/ricardo-mejias-77303513a/
  ContactItem(
      url: "https://www.linkedin.com/in/ricardo-mejias-travieso-77303513a/",
      icon: FontAwesomeIcons.linkedinIn),
  // tg://$telegram"
  ContactItem(
      url: "https://telegram.me/+34644096889", icon: FontAwesomeIcons.telegram),
  ContactItem(
      url: "https://github.com/Ricardo-MT", icon: FontAwesomeIcons.github),
  ContactItem(url: "mailto:rikr2.mt@gmail.com", icon: Icons.mail_outline),
  // whatsapp://send?phone=$whatsapp/
  ContactItem(
      url: "https://wa.me/+34644096889", icon: FontAwesomeIcons.whatsapp),
];

class ContactItem {
  ContactItem({
    required this.url,
    required this.icon,
  });
  String url;
  IconData icon;
}

const _spacer = SizedBox(height: 10);
const _contactStyle =
    TextStyle(fontFamily: "Montserrat", color: AppColors.lightPurple);
