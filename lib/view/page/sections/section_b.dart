import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({
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
  State<SecondSection> createState() => _SecondSection();
}

class _SecondSection extends State<SecondSection> {
  double _top = 0;
  double _percent = 0;
  final double _opacityPercent = 1;
  double _outPercent = 0;
  late final List<GlobalKey> _keys;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
    _keys = [GlobalKey(), GlobalKey(), GlobalKey(), GlobalKey()];
  }

  void listener() {
    int pos = widget.controller.offset ~/ (widget.sectionH);
    if (pos > 3) {
      if (_outPercent != 1) {
        _outPercent = 1;
      }
      return;
    }
    if (pos < 2) {
      return;
    }
    if (pos == 2) {
      if (_outPercent != 0 || _opacityPercent != 1) {
        // setState(() {
        //   _outPercent = 0;
        //   _opacityPercent = 1;
        // });
      }
    }
    if (pos > 2) {
      if (_top != widget.sectionH || _percent != 1) {
        // setState(() {
        //   _top = widget.sectionH;
        //   _percent = 1;
        // });
      }
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
          // item1,
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
                  if (widget.sectionW < 500) {
                    return Row(
                      children: [
                        MuiTimeline(
                          sectionH: widget.sectionH,
                          height: widget.sectionH - 30,
                          // progress: _percent,
                          controller: widget.controller,
                        ),
                        _spacer,
                        // Expanded(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       AnimatedSlide(
                        //         offset: _opacityPercent > 0.4
                        //             ? (_outPercent > 0.1
                        //                 ? const Offset(1.5, 0)
                        //                 : const Offset(0, 0))
                        //             : const Offset(0, 0.2),
                        //         duration: _slideDuration,
                        //         curve: Curves.fastOutSlowIn,
                        //         child: AnimatedOpacity(
                        //           // opacity: min(1, _percent / 0.25 * 3),
                        //           opacity: _opacityPercent > 0.4
                        //               ? (_outPercent > 0.1 ? 0 : 1)
                        //               : 0,
                        //           duration: _duration,
                        //           curve: Curves.linear,
                        //           child: MuiTrayectoryCard(
                        //             active: _percent > 0.16,
                        //             insetShadow: _percent > 0.41,
                        //             icon: Icons.local_library_outlined,
                        //             title: "A-Levels",
                        //             location: "IPVCE Lenin, Havana",
                        //             time: "2009-2012",
                        //           ),
                        //         ),
                        //       ),
                        //       AnimatedSlide(
                        //         offset: _opacityPercent > 0.6
                        //             ? (_outPercent > 0.3
                        //                 ? const Offset(1.5, 0)
                        //                 : const Offset(0, 0))
                        //             : const Offset(0, 0.2),
                        //         duration: _slideDuration,
                        //         curve: Curves.fastOutSlowIn,
                        //         child: AnimatedOpacity(
                        //           // opacity: min(
                        //           //     1, max(0, (_percent - 0.25) / 0.25 * 3)),
                        //           opacity: _opacityPercent > 0.6 ? 1 : 0,
                        //           duration: _duration,
                        //           curve: Curves.ease,
                        //           child: MuiTrayectoryCard(
                        //             active: _percent > 0.41,
                        //             insetShadow: _percent > 0.66,
                        //             icon: Icons.book_outlined,
                        //             title: "2 years in CS",
                        //             location: "University of Havana, Havana",
                        //             time: "2013-2015",
                        //           ),
                        //         ),
                        //       ),
                        //       AnimatedSlide(
                        //         offset: _opacityPercent > 0.8
                        //             ? (_outPercent > 0.5
                        //                 ? const Offset(1.5, 0)
                        //                 : const Offset(0, 0))
                        //             : const Offset(0, 0.2),
                        //         duration: _slideDuration,
                        //         curve: Curves.fastOutSlowIn,
                        //         child: AnimatedOpacity(
                        //           // opacity:
                        //           //     min(1, max(0, (_percent - 0.5) / 0.25 * 3)),
                        //           opacity: _opacityPercent > 0.8 ? 1 : 0,
                        //           duration: _duration,
                        //           curve: Curves.ease,
                        //           child: MuiTrayectoryCard(
                        //             active: _percent > 0.66,
                        //             insetShadow: _percent > 0.84,
                        //             icon: Icons.school_outlined,
                        //             title: "HND Software Dev.",
                        //             location: "IES Saladillo, Algeciras",
                        //             time: "2020-2022",
                        //           ),
                        //         ),
                        //       ),
                        //       AnimatedSlide(
                        //         offset: _opacityPercent > 0.95
                        //             ? (_outPercent > 0.8
                        //                 ? const Offset(1.5, 0)
                        //                 : const Offset(0, 0))
                        //             : const Offset(0, 0.2),
                        //         duration: _slideDuration,
                        //         curve: Curves.fastOutSlowIn,
                        //         child: AnimatedOpacity(
                        //           // opacity: min(
                        //           //     1, max(0, (_percent - 0.70) / 0.25 * 3)),
                        //           opacity: _opacityPercent > 0.95 ? 1 : 0,
                        //           duration: _duration,
                        //           curve: Curves.ease,
                        //           child: MuiTrayectoryCard(
                        //             active: _percent > 0.84,
                        //             insetShadow: _percent > 0.98,
                        //             icon: Icons.important_devices_rounded,
                        //             title: "Fullstack Developer",
                        //             location: "Boorpret, Cádiz",
                        //             time: "2020-2022",
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Expanded(
                            child: Stack(
                          children: [
                            Flow(
                              delegate: ParallaxMobileFlowDelegate(
                                scrollable: Scrollable.of(context)!,
                                sectionH: widget.sectionH,
                                sectionW: widget.sectionW,
                                listItemContext: context,
                                keys: _keys,
                              ),
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: MuiTrayectoryCard(
                                    key: _keys[0],
                                    active: _percent > 0.16,
                                    insetShadow: _percent > 0.41,
                                    icon: Icons.local_library_outlined,
                                    title: "A-Levels",
                                    location: "IPVCE Lenin, Havana",
                                    time: "2009-2012",
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: MuiTrayectoryCard(
                                    key: _keys[1],
                                    active: _percent > 0.41,
                                    insetShadow: _percent > 0.66,
                                    icon: Icons.book_outlined,
                                    title: "2 years in CS",
                                    location: "University of Havana, Havana",
                                    time: "2013-2015",
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: MuiTrayectoryCard(
                                    key: _keys[2],
                                    active: _percent > 0.66,
                                    insetShadow: _percent > 0.84,
                                    icon: Icons.school_outlined,
                                    title: "HND Software Dev.",
                                    location: "IES Saladillo, Algeciras",
                                    time: "2020-2022",
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: MuiTrayectoryCard(
                                    key: _keys[3],
                                    active: _percent > 0.84,
                                    insetShadow: _percent > 0.98,
                                    icon: Icons.important_devices_rounded,
                                    title: "Fullstack Developer",
                                    location: "Boorpret, Cádiz",
                                    time: "2020-2022",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ))
                      ],
                    );
                  }

                  var item1 = MuiTrayectoryVerticalCard(
                    key: _keys[0],
                    active: _percent > 0.16,
                    insetShadow: _percent > 0.41,
                    icon: Icons.local_library_outlined,
                    title: "A-Levels",
                    location: "IPVCE Lenin, Havana",
                    time: "2009-2012",
                  );
                  // var item2 = AnimatedOpacity(
                  //   // opacity: min(1, max(0, (_percent - 0.25) / 0.25 * 3)),
                  //   opacity:
                  //       _opacityPercent > 0.6 ? (_outPercent > 0.1 ? 0 : 1) : 0,
                  //   duration: _duration,
                  //   curve: Curves.ease,
                  //   child: MuiTrayectoryVerticalCard(
                  //     active: _percent > 0.41,
                  //     insetShadow: _percent > 0.66,
                  //     icon: Icons.book_outlined,
                  //     title: "2 years in CS",
                  //     location: "University of Havana, Havana",
                  //     time: "2013-2015",
                  //   ),
                  // );
                  var item2 = MuiTrayectoryVerticalCard(
                    key: _keys[1],
                    active: _percent > 0.41,
                    insetShadow: _percent > 0.66,
                    icon: Icons.book_outlined,
                    title: "2 years in CS",
                    location: "University of Havana, Havana",
                    time: "2013-2015",
                  );
                  // var item3 = AnimatedOpacity(
                  //   // opacity: min(1, max(0, (_percent - 0.5) / 0.25 * 3)),
                  //   opacity:
                  //       _opacityPercent > 0.8 ? (_outPercent > 0.1 ? 0 : 1) : 0,
                  //   duration: _duration,
                  //   curve: Curves.ease,
                  //   child: MuiTrayectoryVerticalCard(
                  //     active: _percent > 0.66,
                  //     insetShadow: _percent > 0.84,
                  //     icon: Icons.school_outlined,
                  //     title: "HND Software Dev.",
                  //     location: "IES Saladillo, Algeciras",
                  //     time: "2020-2022",
                  //   ),
                  // );
                  var item3 = MuiTrayectoryVerticalCard(
                    key: _keys[2],
                    active: _percent > 0.66,
                    insetShadow: _percent > 0.84,
                    icon: Icons.school_outlined,
                    title: "HND Software Dev.",
                    location: "IES Saladillo, Algeciras",
                    time: "2020-2022",
                  );

                  // var item4 = AnimatedOpacity(
                  //   // opacity: min(1, max(0, (_percent - 0.70) / 0.25 * 3)),
                  //   opacity: _opacityPercent > 0.95
                  //       ? (_outPercent > 0.1 ? 0 : 1)
                  //       : 0,
                  //   duration: _duration,
                  //   curve: Curves.ease,
                  //   child: MuiTrayectoryVerticalCard(
                  //     active: _percent > 0.84,
                  //     insetShadow: _percent > 0.98,
                  //     icon: Icons.important_devices_rounded,
                  //     title: "Fullstack Developer",
                  //     location: "Boorpret, Cádiz",
                  //     time: "2020-2022",
                  //   ),
                  // );
                  var item4 = MuiTrayectoryVerticalCard(
                    key: _keys[3],
                    active: _percent > 0.84,
                    insetShadow: _percent > 0.98,
                    icon: Icons.important_devices_rounded,
                    title: "Fullstack Developer",
                    location: "Boorpret, Cádiz",
                    time: "2020-2022",
                  );

                  if (widget.sectionW < 1000) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Flow(
                                delegate: ParallaxTabletFlowDelegate(
                                  scrollable: Scrollable.of(context)!,
                                  sectionH: widget.sectionH,
                                  sectionW: widget.sectionW,
                                  listItemContext: context,
                                  keys: _keys,
                                ),
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: item1),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: item2),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: item3),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: item4),
                                ],
                              )
                            ],
                          ),
                        ),
                        _spacer,
                        MuiTimeline(
                          sectionH: widget.sectionH,
                          height: widget.sectionW - 60,
                          controller: widget.controller,
                          vertical: false,
                        ),
                        _spacer
                      ],
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Flow(
                              delegate: ParallaxDesktopFlowDelegate(
                                scrollable: Scrollable.of(context)!,
                                sectionH: widget.sectionH,
                                sectionW: widget.sectionW,
                                listItemContext: context,
                                keys: _keys,
                              ),
                              children: [
                                Align(
                                    alignment: Alignment.topLeft, child: item1),
                                Align(
                                    alignment: Alignment.topLeft, child: item2),
                                Align(
                                    alignment: Alignment.topLeft, child: item3),
                                Align(
                                    alignment: Alignment.topLeft, child: item4),
                              ],
                            )
                          ],
                        ),
                      ),
                      MuiTimeline(
                        sectionH: widget.sectionH,
                        height: widget.sectionW - 60,
                        controller: widget.controller,
                        vertical: false,
                      ),
                      _spacer,
                      _spacer
                    ],
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

class MuiTrayectoryCard extends StatelessWidget {
  const MuiTrayectoryCard({
    Key? key,
    this.active = true,
    this.insetShadow = false,
    required this.icon,
    required this.title,
    required this.location,
    required this.time,
  }) : super(key: key);
  final bool active;
  final bool insetShadow;
  final IconData icon;
  final String title;
  final String location;
  final String time;

  @override
  Widget build(BuildContext context) {
    String familyA = "Montserrat";
    String familyB = "Comfortaa";

    return MuiCard(
      heigth: 116,
      width: 294,
      decorated: true,
      active: active,
      insetShadow: insetShadow,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0).copyWith(left: 20),
            child: MuiBadge(
                child: Icon(
              icon,
              size: 28,
              color: AppColors.whitePrimary,
            )),
          )),
          Expanded(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20).copyWith(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.whitePrimary,
                    fontSize: 17,
                    fontFamily: familyA,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  location,
                  style: TextStyle(
                    color: AppColors.whiteAccent,
                    fontSize: 12,
                    fontFamily: familyB,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: AppColors.whiteAccent,
                    fontSize: 12,
                    fontFamily: familyB,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class MuiTrayectoryVerticalCard extends StatelessWidget {
  const MuiTrayectoryVerticalCard({
    Key? key,
    this.active = true,
    this.insetShadow = false,
    required this.icon,
    required this.title,
    required this.location,
    required this.time,
  }) : super(key: key);
  final bool active;
  final bool insetShadow;
  final IconData icon;
  final String title;
  final String location;
  final String time;

  @override
  Widget build(BuildContext context) {
    String familyA = "Montserrat";
    String familyB = "Comfortaa";

    return MuiCard(
      heigth: 300,
      width: 220,
      decorated: true,
      active: active,
      insetShadow: insetShadow,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: MuiBadge(
                  child: Icon(
                icon,
                size: 28,
                color: AppColors.whitePrimary,
              )),
            )),
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20).copyWith(right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.whitePrimary,
                      fontSize: 22,
                      fontFamily: familyA,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    location,
                    style: TextStyle(
                      color: AppColors.whiteAccent,
                      fontSize: 12,
                      fontFamily: familyB,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: AppColors.whiteAccent,
                      fontSize: 12,
                      fontFamily: familyB,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class MuiTimeline extends StatefulWidget {
  const MuiTimeline({
    Key? key,
    required this.height,
    required this.sectionH,
    required this.controller,
    this.vertical = true,
  }) : super(key: key);
  final double height;
  final bool vertical;
  final double sectionH;
  final ScrollController controller;

  @override
  State<MuiTimeline> createState() => _MuiTimelineState();
}

class _MuiTimelineState extends State<MuiTimeline> {
  late double progress;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
    progress = 0;
  }

  void listener() {
    int pos = widget.controller.offset ~/ (widget.sectionH);
    if (pos > 3) {
      return;
    }
    if (pos < 2) {
      if (progress != 0) {
        setState(() {
          progress = 0;
        });
      }
      return;
    }
    if (pos > 2) {
      if (progress != 1) {
        setState(() {
          progress = 1;
        });
      }
      return;
    }
    double p = widget.controller.offset - widget.sectionH * pos;

    setState(() {
      progress = min(p, widget.sectionH) / widget.sectionH;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: _slideDuration,
      offset: widget.vertical
          ? Offset(progress == 0 ? -3 : 0, 0)
          : Offset(0, progress == 0 ? 3 : 0),
      child: MuiCard(
        heigth: widget.vertical ? widget.height : 12,
        width: widget.vertical ? 12 : widget.height,
        insetShadow: true,
        child: Align(
          alignment:
              widget.vertical ? Alignment.topCenter : Alignment.centerLeft,
          child: MuiCard(
            heigth: widget.vertical
                ? min((widget.height - 2) * progress, (widget.height - 2))
                : 10,
            width: widget.vertical
                ? 10
                : min((widget.height - 2) * progress, (widget.height - 2)),
            curve: Curves.linear,
            containerDuration: 0,
            colorStart: const Color(0xFF4B3C50),
            colorEnd: const Color(0xFF9678A0),
            backgroundColor: const Color(0xFF775A81),
          ),
        ),
      ),
    );
  }
}

class ParallaxDesktopFlowDelegate extends FlowDelegate {
  ParallaxDesktopFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.keys,
    required this.sectionH,
    required this.sectionW,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final List<GlobalKey> keys;
  final double sectionH;
  final double sectionW;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension - 0.5).clamp(0.0, 1.0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final sizes = keys
        .map((k) => (k.currentContext!.findRenderObject() as RenderBox).size)
        .toList();
    final backgroundSize = sizes[0];
    final listItemSize = context.size;
    double space =
        (listItemSize.width - backgroundSize.width * context.childCount) /
            (context.childCount + 1);
    double vSpace = (listItemSize.height - backgroundSize.height) / 2;
    double keyPart = 0.5 / (context.childCount - 1);
    for (var i = 0; i < context.childCount; i++) {
      context.paintChild(
        i,
        transform: Transform.translate(
            offset: Offset(
          space * (1 + i) + backgroundSize.width * i,
          vSpace +
              (1 - (1 - scrollFraction) / (0.5 + i * keyPart)).clamp(0, 1) *
                  vSpace *
                  2,
        )).transform,
        opacity: ((1 - scrollFraction) / (0.5 + i * keyPart)).clamp(0, 1),
      );
    }
  }

  @override
  bool shouldRepaint(ParallaxDesktopFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        keys.hashCode != oldDelegate.keys.hashCode;
  }
}

class ParallaxTabletFlowDelegate extends FlowDelegate {
  ParallaxTabletFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.keys,
    required this.sectionH,
    required this.sectionW,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final List<GlobalKey> keys;
  final double sectionH;
  final double sectionW;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension - 0.5).clamp(0.0, 1.0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final sizes = keys
        .map((k) => (k.currentContext!.findRenderObject() as RenderBox).size)
        .toList();
    final backgroundSize = sizes[0];
    final listItemSize = context.size;
    double space = (listItemSize.width - backgroundSize.width * 2) / 3;
    double vSpace = (listItemSize.height - backgroundSize.height * 2) / 3;
    double keyPart = 0.5 / (context.childCount - 1);
    for (var i = 0; i < context.childCount; i++) {
      var dx = space * (1 + i % 2) + backgroundSize.width * (i % 2);
      var dy = vSpace * (1 + i ~/ 2) +
          backgroundSize.height * (i ~/ 2) +
          (1 - (1 - scrollFraction) / (0.5 + i * keyPart)).clamp(0, 1) *
              vSpace *
              5;
      context.paintChild(
        i,
        transform: Transform.translate(offset: Offset(dx, dy)).transform,
        opacity: ((1 - scrollFraction) / (0.5 + i * keyPart)).clamp(0, 1),
      );
    }
  }

  @override
  bool shouldRepaint(ParallaxTabletFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        keys.hashCode != oldDelegate.keys.hashCode;
  }
}

class ParallaxMobileFlowDelegate extends FlowDelegate {
  ParallaxMobileFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.keys,
    required this.sectionH,
    required this.sectionW,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final List<GlobalKey> keys;
  final double sectionH;
  final double sectionW;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension - 0.5).clamp(0.0, 1.0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final sizes = keys
        .map((k) => (k.currentContext!.findRenderObject() as RenderBox).size)
        .toList();
    final backgroundSize = sizes[0];
    final listItemSize = context.size;
    double space = (listItemSize.width - backgroundSize.width) / 2;
    double vSpace =
        (listItemSize.height - backgroundSize.height * context.childCount) /
            (context.childCount + 1);
    double keyPart = 0.5 / (context.childCount - 1);
    for (var i = 0; i < context.childCount; i++) {
      context.paintChild(
        i,
        transform: Transform.translate(
            offset: Offset(
          space,
          (vSpace * (1 + i) +
              backgroundSize.height * i +
              (1 - (1 - scrollFraction) / (0.5 + i * keyPart)).clamp(0, 1) *
                  vSpace *
                  6),
        )).transform,
        opacity: 1,
      );
    }
  }

  @override
  bool shouldRepaint(ParallaxMobileFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        keys.hashCode != oldDelegate.keys.hashCode;
  }
}

const _spacer = SizedBox(
  width: 20,
  height: 15,
);

const _slideDuration = Duration(milliseconds: 500);
