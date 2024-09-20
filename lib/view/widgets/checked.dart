import 'package:flutter/material.dart';

class MuiChecked extends StatefulWidget {
  const MuiChecked({Key? key}) : super(key: key);

  @override
  State<MuiChecked> createState() => _MuiChecked();
}

class _MuiChecked extends State<MuiChecked> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checked,
      onChanged: (value) => setState(() {
        checked = value == true;
      }),
    );
  }
}
