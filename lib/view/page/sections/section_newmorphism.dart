import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:ricardomejiastravieso/utils/theming.dart';
import 'package:ricardomejiastravieso/view/widgets/card.dart';

class SectionInitialNewmorphism extends StatefulWidget {
  const SectionInitialNewmorphism({
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
  State<SectionInitialNewmorphism> createState() =>
      _SectionInitialNewmorphism();
}

class _SectionInitialNewmorphism extends State<SectionInitialNewmorphism>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          NameLayer(sectionH: widget.sectionH, sectionW: widget.sectionW),
          ScaleTransition(
            scale: _animation,
            child: const MuiCard(
              circular: true,
              width: 400,
              heigth: 400,
            ),
          ),
          ProfessionLayer(sectionH: widget.sectionH, sectionW: widget.sectionW),
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

var color = const Color(0xFF8a6c94);
var style = const TextStyle(color: Colors.white, fontSize: 40);

class NameLayer extends StatelessWidget {
  NameLayer({
    Key? key,
    required this.sectionH,
    required this.sectionW,
  }) : super(key: key);
  final double sectionH;
  final double sectionW;
  final GlobalKey _nameKeyA = GlobalKey();
  final GlobalKey _nameKeyB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionH,
      width: sectionW,
      child: _buildParallaxBackground(context),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: SlideNameFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        nameKeyA: _nameKeyA,
        nameKeyB: _nameKeyB,
        sectionH: sectionH,
        sectionW: sectionW,
      ),
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Ricardo",
            key: _nameKeyA,
            style: style.copyWith(
              fontFamily: "Comfortaa",
              color: AppColors.whitePrimary,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "<Ricardo/>",
            key: _nameKeyB,
            style: style.copyWith(
              fontFamily: "LibreBarcode",
              color: AppColors.whitePrimary,
            ),
          ),
        ),
        // Image.asset(
        //   project.imageUrl,
        //   key: _backgroundImageKey,
        //   fit: BoxFit.cover,
        // )
      ],
    );
  }
}

class ProfessionLayer extends StatelessWidget {
  ProfessionLayer({
    Key? key,
    required this.sectionH,
    required this.sectionW,
  }) : super(key: key);
  final double sectionH;
  final double sectionW;
  final GlobalKey _nameKeyA = GlobalKey();
  final GlobalKey _nameKeyB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionH,
      width: sectionW,
      child: _buildParallaxBackground(context),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: SlideProfessionFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        nameKeyA: _nameKeyA,
        nameKeyB: _nameKeyB,
        sectionH: sectionH,
        sectionW: sectionW,
      ),
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "software",
            key: _nameKeyA,
            style: style.copyWith(
              fontFamily: "Monoton",
              fontSize: max(sectionW * 0.09, 60),
              color: color,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "developer",
            key: _nameKeyB,
            style: style.copyWith(
              fontFamily: "Monoton",
              fontSize: sectionW * 0.09,
              foreground: Paint()..shader = linearGradient,
            ),
          ),
        ),
        // Image.asset(
        //   project.imageUrl,
        //   key: _backgroundImageKey,
        //   fit: BoxFit.cover,
        // )
      ],
    );
  }
}

class SlideProfessionFlowDelegate extends FlowDelegate {
  SlideProfessionFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.nameKeyA,
    required this.nameKeyB,
    required this.sectionH,
    required this.sectionW,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey nameKeyA;
  final GlobalKey nameKeyB;
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
      listItemBox.size.topLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy.abs() / viewportDimension).clamp(0.0, 1.0);

    if (scrollFraction == 1) {
      return;
    }

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final nameASize =
        (nameKeyA.currentContext!.findRenderObject() as RenderBox).size;
    final nameBSize =
        (nameKeyB.currentContext!.findRenderObject() as RenderBox).size;

    double leftA = (sectionW - nameASize.width) / 2;
    double leftB = (sectionW - nameBSize.width) / 2;
    double s1 = (sectionH - nameASize.height - nameBSize.height) / 9;

    context.paintChild(
      0,
      transform: Transform.translate(
              offset: Offset(leftA - sectionW * scrollFraction, s1 * 3))
          .transform,
    );
    context.paintChild(
      1,
      transform: Transform.translate(
              offset: Offset(leftB + sectionW * scrollFraction,
                  s1 * 3 + nameASize.height - 0.3 * nameASize.height))
          .transform,
    );
  }

  @override
  bool shouldRepaint(SlideProfessionFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        nameKeyA != oldDelegate.nameKeyA;
  }
}

class SlideNameFlowDelegate extends FlowDelegate {
  SlideNameFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.nameKeyA,
    required this.nameKeyB,
    required this.sectionH,
    required this.sectionW,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey nameKeyA;
  final GlobalKey nameKeyB;
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
      listItemBox.size.topLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy.abs() / viewportDimension).clamp(0.0, 1.0);

    if (scrollFraction == 1) {
      return;
    }

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final nameASize =
        (nameKeyA.currentContext!.findRenderObject() as RenderBox).size;
    final nameBSize =
        (nameKeyB.currentContext!.findRenderObject() as RenderBox).size;

    double leftA = (sectionW - nameASize.width) / 3;
    double leftB = ((sectionW - nameBSize.width) / 3) * 2;
    double s1 = (sectionH - (sectionH * 0.6 + 30)) / 2;

    context.paintChild(
      0,
      transform: Transform.translate(
              offset: Offset(leftA + sectionW * scrollFraction, s1))
          .transform,
    );
    context.paintChild(
      1,
      transform: Transform.translate(
              offset: Offset(leftB + 40 - sectionW * scrollFraction,
                  sectionH - nameBSize.height - s1))
          .transform,
    );
  }

  @override
  bool shouldRepaint(SlideNameFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        nameKeyA != oldDelegate.nameKeyA;
  }
}
