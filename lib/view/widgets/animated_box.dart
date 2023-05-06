import 'dart:math';

import 'package:flutter/material.dart';

class MuiAnimatedBox extends StatefulWidget {
  const MuiAnimatedBox({Key? key}) : super(key: key);

  @override
  State<MuiAnimatedBox> createState() => _MuiAnimatedBox();
}

class _MuiAnimatedBox extends State<MuiAnimatedBox> {
  late double _h;
  late double _w;
  late Color _color;
  late BorderRadiusGeometry _borderRadius;

  @override
  void initState() {
    super.initState();
    _h = 50;
    _w = 50;
    _color = Colors.red;
    _borderRadius = BorderRadius.zero;
  }

  void nextState() {
    final random = Random();
    setState(() {
      _w = random.nextInt(600).toDouble();
      _h = random.nextInt(600).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  Alignment getAlignment() {
    int res = 1;
    int bit1 = _h > 300 ? 1 : 0;
    int bit2 = _w > 300 ? 1 : 0;
    int bit3 = _h % 2 == 0 ? 1 : 0;

    res = 4 * bit3 + 2 * bit2 + bit1;
    switch (res) {
      case 1:
        return Alignment.bottomCenter;
      case 2:
        return Alignment.bottomLeft;
      case 3:
        return Alignment.bottomRight;
      case 4:
        return Alignment.center;
      case 5:
        return Alignment.centerLeft;
      case 6:
        return Alignment.centerRight;
      case 7:
        return Alignment.topCenter;
      case 8:
        return Alignment.topLeft;
      case 9:
        return Alignment.topRight;
      default:
        return Alignment.bottomCenter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Spacer(),
        Expanded(
          child: AnimatedAlign(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 1100),
            alignment: getAlignment(),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: _w,
              height: _h,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
            ),
          ),
        ),
        // const Spacer(),
        TextButton(onPressed: nextState, child: const Text("Animate"))
      ],
    );
  }
}
