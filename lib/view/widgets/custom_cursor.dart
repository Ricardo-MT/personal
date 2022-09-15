import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/utils/theming.dart';

class CustomCursorLayer extends StatefulWidget {
  const CustomCursorLayer({Key? key}) : super(key: key);

  @override
  State<CustomCursorLayer> createState() => _CustomCursorLayer();
}

class _CustomCursorLayer extends State<CustomCursorLayer> {
  late Offset offset;
  @override
  void initState() {
    super.initState();
    offset = const Offset(
      -100,
      -100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.none,
        onHover: (eve) {
          setState(() {
            offset = eve.position;
          });
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
              top: offset.dy - 50,
              left: offset.dx - 50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.whitePrimary)),
              ),
            ),
            Positioned(
                top: offset.dy - 4,
                left: offset.dx - 4,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whitePrimary,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
