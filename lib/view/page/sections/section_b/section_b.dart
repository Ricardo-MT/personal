import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricardomejiastravieso/l10n/l10n.dart';
import 'package:ricardomejiastravieso/utils/theme.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_b/bloc/sectionb_bloc.dart';
import 'package:ricardomejiastravieso/view/page/sections/section_b/bloc/timeline_bloc.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';

final List<GlobalKey> _keys = [
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey()
];

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
    required this.controller,
    required this.sectionH,
    required this.sectionW,
  });
  final ScrollController controller;
  final double sectionH;
  final double sectionW;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionbBloc(
        controller: controller,
        sectionH: sectionH,
      ),
      child: _SecondSection(
        controller: controller,
        sectionH: sectionH,
        sectionW: sectionW,
      ),
    );
  }
}

class _SecondSection extends StatelessWidget {
  const _SecondSection({
    super.key,
    required this.controller,
    required this.sectionH,
    required this.sectionW,
  });
  final ScrollController controller;
  final double sectionH;
  final double sectionW;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return RepaintBoundary(
      child: Stack(
        children: [
          BlocBuilder<SectionbBloc, SectionbState>(
            buildWhen: (previous, current) => previous.top != current.top,
            builder: (context, state) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 0),
                right: 0,
                left: 0,
                top: state.top,
                child: SizedBox(
                  width: sectionW,
                  height: sectionH,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Builder(builder: (context) {
                      if (sectionW < 500) {
                        return Row(
                          children: [
                            MuiTimeline(
                              sectionH: sectionH,
                              height: sectionH - 30,
                              controller: controller,
                            ),
                            _spacer,
                            Expanded(
                                child: Stack(
                              children: [
                                Flow(
                                  delegate: ParallaxMobileFlowDelegate(
                                    scrollable: Scrollable.of(context),
                                    sectionH: sectionH,
                                    sectionW: sectionW,
                                    listItemContext: context,
                                    keys: _keys,
                                  ),
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: BlocBuilder<SectionbBloc,
                                          SectionbState>(
                                        buildWhen: (previous, current) =>
                                            previous.percent > 0.16 !=
                                                current.percent > 0.16 ||
                                            previous.percent > 0.41 !=
                                                current.percent > 0.41,
                                        builder: (context, state) {
                                          return MuiTrayectoryCard(
                                            key: _keys[0],
                                            active: state.percent > 0.16,
                                            insetShadow: state.percent > 0.41,
                                            icon: icons[0],
                                            title: l10n.sectionBExp1Title,
                                            location: l10n.sectionBExp1Location,
                                            time: l10n.sectionBExp1Time,
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: BlocBuilder<SectionbBloc,
                                          SectionbState>(
                                        buildWhen: (previous, current) =>
                                            previous.percent > 0.41 !=
                                                current.percent > 0.41 ||
                                            previous.percent > 0.66 !=
                                                current.percent > 0.66,
                                        builder: (context, state) {
                                          return MuiTrayectoryCard(
                                            key: _keys[1],
                                            active: state.percent > 0.41,
                                            insetShadow: state.percent > 0.66,
                                            icon: icons[1],
                                            title: l10n.sectionBExp2Title,
                                            location: l10n.sectionBExp2Location,
                                            time: l10n.sectionBExp2Time,
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: BlocBuilder<SectionbBloc,
                                          SectionbState>(
                                        buildWhen: (previous, current) =>
                                            previous.percent > 0.66 !=
                                                current.percent > 0.66 ||
                                            previous.percent > 0.84 !=
                                                current.percent > 0.84,
                                        builder: (context, state) {
                                          return MuiTrayectoryCard(
                                            key: _keys[2],
                                            active: state.percent > 0.66,
                                            insetShadow: state.percent > 0.84,
                                            icon: icons[2],
                                            title: l10n.sectionBExp3Title,
                                            location: l10n.sectionBExp3Location,
                                            time: l10n.sectionBExp3Time,
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: BlocBuilder<SectionbBloc,
                                          SectionbState>(
                                        buildWhen: (previous, current) =>
                                            previous.percent > 0.84 !=
                                                current.percent > 0.84 ||
                                            previous.percent > 0.98 !=
                                                current.percent > 0.98,
                                        builder: (context, state) {
                                          return MuiTrayectoryCard(
                                            key: _keys[3],
                                            active: state.percent > 0.84,
                                            insetShadow: state.percent > 0.98,
                                            icon: icons[3],
                                            title: l10n.sectionBExp4Title,
                                            location: l10n.sectionBExp4Location,
                                            time: l10n.sectionBExp4Time,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ))
                          ],
                        );
                      }

                      var item1 = BlocBuilder<SectionbBloc, SectionbState>(
                        buildWhen: (previous, current) =>
                            previous.percent > 0.16 != current.percent > 0.16 ||
                            previous.percent > 0.41 != current.percent > 0.41,
                        builder: (context, state) {
                          return MuiTrayectoryVerticalCard(
                            key: _keys[0],
                            active: state.percent > 0.16,
                            insetShadow: state.percent > 0.41,
                            icon: icons[0],
                            title: l10n.sectionBExp1Title,
                            location: l10n.sectionBExp1Location,
                            time: l10n.sectionBExp1Time,
                          );
                        },
                      );
                      var item2 = BlocBuilder<SectionbBloc, SectionbState>(
                        buildWhen: (previous, current) =>
                            previous.percent > 0.41 != current.percent > 0.41 ||
                            previous.percent > 0.66 != current.percent > 0.66,
                        builder: (context, state) {
                          return MuiTrayectoryVerticalCard(
                            key: _keys[1],
                            active: state.percent > 0.41,
                            insetShadow: state.percent > 0.66,
                            icon: icons[1],
                            title: l10n.sectionBExp2Title,
                            location: l10n.sectionBExp2Location,
                            time: l10n.sectionBExp2Time,
                          );
                        },
                      );
                      var item3 = BlocBuilder<SectionbBloc, SectionbState>(
                        buildWhen: (previous, current) =>
                            previous.percent > 0.66 != current.percent > 0.66 ||
                            previous.percent > 0.84 != current.percent > 0.84,
                        builder: (context, state) {
                          return MuiTrayectoryVerticalCard(
                            key: _keys[2],
                            active: state.percent > 0.66,
                            insetShadow: state.percent > 0.84,
                            icon: icons[2],
                            title: l10n.sectionBExp3Title,
                            location: l10n.sectionBExp3Location,
                            time: l10n.sectionBExp3Time,
                          );
                        },
                      );
                      var item4 = BlocBuilder<SectionbBloc, SectionbState>(
                        buildWhen: (previous, current) =>
                            previous.percent > 0.84 != current.percent > 0.84 ||
                            previous.percent > 0.98 != current.percent > 0.98,
                        builder: (context, state) {
                          return MuiTrayectoryVerticalCard(
                            key: _keys[3],
                            active: state.percent > 0.84,
                            insetShadow: state.percent > 0.98,
                            icon: icons[3],
                            title: l10n.sectionBExp4Title,
                            location: l10n.sectionBExp4Location,
                            time: l10n.sectionBExp4Time,
                          );
                        },
                      );

                      if (sectionW < 1000) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Flow(
                                    delegate: ParallaxTabletFlowDelegate(
                                      scrollable: Scrollable.of(context),
                                      sectionH: sectionH,
                                      sectionW: sectionW,
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
                              sectionH: sectionH,
                              height: sectionW - 60,
                              controller: controller,
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
                                    scrollable: Scrollable.of(context),
                                    sectionH: sectionH,
                                    sectionW: sectionW,
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
                          MuiTimeline(
                            sectionH: sectionH,
                            height: sectionW - 60,
                            controller: controller,
                            vertical: false,
                          ),
                          _spacer,
                          _spacer
                        ],
                      );
                    }),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

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
    String familyA = "Comfortaa";
    String familyB = "Comfortaa";
    Color textPrimaryColor = Theme.of(context).colorScheme.primary;
    Color textSecondaryColor = Theme.of(context).colorScheme.secondary;

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
                    color: textPrimaryColor,
                    fontSize: 17,
                    fontFamily: familyA,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  location,
                  style: TextStyle(
                    color: textSecondaryColor,
                    fontSize: 12,
                    fontFamily: familyB,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: textSecondaryColor,
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
    String familyA = "Comfortaa";
    String familyB = "Comfortaa";
    Color textPrimaryColor = Theme.of(context).colorScheme.primary;
    Color textSecondaryColor = Theme.of(context).colorScheme.secondary;

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
                      color: textPrimaryColor,
                      fontSize: 22,
                      fontFamily: familyA,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    location,
                    style: TextStyle(
                      color: textSecondaryColor,
                      fontSize: 12,
                      fontFamily: familyB,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: textSecondaryColor,
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

class MuiTimeline extends StatelessWidget {
  const MuiTimeline({
    super.key,
    this.vertical = true,
    required this.height,
    required this.controller,
    required this.sectionH,
  });
  final bool vertical;
  final double height;
  final ScrollController controller;
  final double sectionH;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimelineBloc(
        controller: controller,
        sectionH: sectionH,
      ),
      child: _MuiTimeline(
        vertical: vertical,
        height: height,
        controller: controller,
        sectionH: sectionH,
      ),
    );
  }
}

class _MuiTimeline extends StatelessWidget {
  const _MuiTimeline({
    super.key,
    this.vertical = true,
    required this.height,
    required this.controller,
    required this.sectionH,
  });
  final bool vertical;
  final double height;
  final ScrollController controller;
  final double sectionH;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimelineBloc, TimelineState>(
      buildWhen: (previous, current) =>
          previous.isProgressZero != current.isProgressZero,
      builder: (context, state) {
        return AnimatedSlide(
          duration: _slideDuration,
          offset: vertical
              ? Offset(state.isProgressZero ? -3 : 0, 0)
              : Offset(0, state.isProgressZero ? 3 : 0),
          child: MuiCard(
            heigth: vertical ? height : 12,
            width: vertical ? 12 : height,
            insetShadow: true,
            child: Align(
              alignment: vertical ? Alignment.topCenter : Alignment.centerLeft,
              child: BlocBuilder<TimelineBloc, TimelineState>(
                buildWhen: (previous, current) =>
                    previous.progress != current.progress,
                builder: (context, state) {
                  return MuiCard(
                    heigth: vertical
                        ? min((height - 2) * state.progress, (height - 2))
                        : 10,
                    width: vertical
                        ? 10
                        : min((height - 2) * state.progress, (height - 2)),
                    curve: Curves.linear,
                    containerDuration: 0,
                    colorStart: const Color(0xFF4B3C50),
                    colorEnd: const Color(0xFF9678A0),
                    backgroundColor: const Color(0xFF775A81),
                  );
                },
              ),
            ),
          ),
        );
      },
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

const icons = [
  Icons.book_outlined,
  Icons.school_outlined,
  Icons.important_devices_rounded,
  Icons.important_devices_rounded
];

const _spacer = SizedBox(
  width: 20,
  height: 15,
);

const _slideDuration = Duration(milliseconds: 500);
