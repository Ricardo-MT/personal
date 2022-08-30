import 'package:flutter/material.dart';
import 'package:ricardomejiastravieso/view/widgets/checked.dart';

class NominasPage extends StatelessWidget {
  const NominasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var months = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul"];
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text("1ra mitad"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("2da mitad"),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(""),
                )
              ],
            ),
          ),
          ...months
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const MuiChecked(),
                        const MuiChecked(),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ))
              .toList()
        ],
      )),
    );
  }
}
