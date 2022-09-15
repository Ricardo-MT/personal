import 'package:flutter/material.dart';

class MuiAnimatedIcon extends StatefulWidget {
  const MuiAnimatedIcon({Key? key}) : super(key: key);

  @override
  State<MuiAnimatedIcon> createState() => _MuiAnimatedIcon();
}

class _MuiAnimatedIcon extends State<MuiAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, -0.2),
    end: const Offset(0.0, 0.2),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));
  late CurvedAnimation anim;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        height: 28,
        width: 28,
        child: SlideTransition(
          position: _offsetAnimation,
          child: const Center(
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
