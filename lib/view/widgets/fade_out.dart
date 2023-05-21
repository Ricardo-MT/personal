import 'package:flutter/material.dart';

class FadeOutLayer extends StatefulWidget {
  const FadeOutLayer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<FadeOutLayer> createState() => _FadeOutLayer();
}

class _FadeOutLayer extends State<FadeOutLayer> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    value: 1,
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        precacheImage(const AssetImage("assets/backLight.png"), context),
        precacheImage(const AssetImage("assets/back.png"), context),
        precacheImage(const AssetImage("assets/images/front.png"), context),
        precacheImage(const AssetImage("assets/images/abajo.png"), context),
        precacheImage(const AssetImage("assets/images/arriba.png"), context),
      ]);
      await Future.delayed(const Duration(milliseconds: 100));
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: IgnorePointer(
        child: FadeTransition(
          opacity: _animation,
          child: widget.child,
        ),
      ),
    );
  }
}
