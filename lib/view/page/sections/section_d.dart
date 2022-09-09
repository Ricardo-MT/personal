import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: List.generate(
              projectsA.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    child: MuiCard(
                      heigth: (sectionH - 32) * 0.5,
                      width: (sectionH - 32) * 0.265,
                      child: LocationListItem(
                        project: projectsA[index],
                      ),
                    ),
                  )),
        ),
        Padding(
          padding: EdgeInsets.only(top: (sectionH - 32) * 0.25),
          child: Column(
            children: List.generate(
                projectsB.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: MuiCard(
                        heigth: (sectionH - 32) * 0.5,
                        width: (sectionH - 32) * 0.265,
                        child: LocationListItem(
                          project: projectsB[index],
                        ),
                      ),
                    )),
          ),
        )
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
class LocationListItem extends StatelessWidget {
  LocationListItem({
    super.key,
    required this.project,
  });

  final MuiProject project;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 16,
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
          border: Border.all(width: 4, color: defaultColorEnd),
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
            style: TextStyle(
              color: AppColors.whitePrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
          Text(
            project.country,
            style: TextStyle(
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
