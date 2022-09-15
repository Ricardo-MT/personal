import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theme.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';

class SectionFourth extends StatelessWidget {
  const SectionFourth({
    Key? key,
    required this.sections,
    required this.sectionH,
    required this.sectionW,
    required this.totalH,
  }) : super(key: key);
  final int sections;
  final double sectionH;
  final double sectionW;
  final double totalH;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PCItem(
          project: projectsA[0],
          sectionH: sectionH,
          sectionW: sectionW,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  projectsA.length,
                  (index) => MobileItem(
                        sectionH: sectionH,
                        sectionW: sectionW,
                        project: projectsA[index],
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(top: (sectionH - 32) * 0.25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    projectsB.length,
                    (index) => MobileItem(
                          sectionH: sectionH,
                          sectionW: sectionW,
                          project: projectsB[index],
                        )),
              ),
            )
          ],
        ),
      ],
    );
  }
}

List<MuiProject> projectsA = [
  MuiProject(
      imageUrl: "assets/app/aberas.png",
      name: "ABERAS",
      country: "React Native, MERN"),
  MuiProject(
      imageUrl: "assets/app/egresado.png",
      name: "EGRESADO",
      country: "Flutter, Node"),
  MuiProject(
      imageUrl: "assets/app/flanest.png",
      name: "Flanest",
      country: "React Native, MERN"),
];
List<MuiProject> projectsB = [
  MuiProject(
      imageUrl: "assets/app/lmr.png",
      name: "LiveMusicRadar",
      country: "Flutter"),
  MuiProject(
      imageUrl: "assets/app/ponina.png",
      name: "Ponina",
      country: "React Native, MERN"),
];

class MuiProject {
  MuiProject({
    required this.imageUrl,
    required this.name,
    required this.country,
  });
  final String imageUrl;
  final String name;
  final String country;
}

@immutable
class MobileItem extends StatelessWidget {
  MobileItem({
    super.key,
    required this.project,
    required this.sectionH,
    required this.sectionW,
  });

  final MuiProject project;
  final GlobalKey _backgroundImageKey = GlobalKey();
  final double sectionH;
  final double sectionW;

  @override
  Widget build(BuildContext context) {
    double w = min((sectionW / 2 - 32), 300);
    double aspectRatio = max(0.45, min(0.54, sectionW / sectionH));
    double h = w / aspectRatio;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: MuiCard(
        // heigth: (sectionH - 32) * 0.5,
        // width: (sectionH - 32) * 0.265,
        heigth: h,
        width: w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.asset(
          project.imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        )
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 4, color: AppColors.defaultColorEnd),
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 12,
      bottom: 15,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: const TextStyle(
              color: AppColors.whitePrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
          Text(
            project.country,
            style: const TextStyle(
              color: AppColors.whitePrimary,
              fontSize: 12,
              fontFamily: "Comfortaa",
            ),
          ),
        ],
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;
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
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

@immutable
class PCItem extends StatelessWidget {
  PCItem({
    super.key,
    required this.project,
    required this.sectionH,
    required this.sectionW,
  });

  final MuiProject project;
  final GlobalKey _backgroundImageKey = GlobalKey();
  final double sectionH;
  final double sectionW;

  @override
  Widget build(BuildContext context) {
    double w = min((sectionW / 2 - 32), 300) * 2 + 32;
    // double aspectRatio = max(0.45, min(0.54, sectionW / sectionH));
    double h = w * (9 / 15);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Align(
              child: MuiCard(
                heigth: h - 4,
                width: w - 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      _buildParallaxBackground(context),
                      _buildGradient(),
                      _buildTitleAndSubtitle(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: _buildKeyboard(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.asset(
          project.imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        )
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 4, color: AppColors.defaultColorEnd),
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: const TextStyle(
              color: AppColors.whitePrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
          Text(
            project.country,
            style: const TextStyle(
              color: AppColors.whitePrimary,
              fontSize: 12,
              fontFamily: "Comfortaa",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyboard() {
    return Container(
      height: 14,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(3),
          topLeft: Radius.circular(3),
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
        // border: Border.all(width: 4, color: defaultColorEnd),
        color: AppColors.defaultColorEnd,
      ),
    );
  }
}
