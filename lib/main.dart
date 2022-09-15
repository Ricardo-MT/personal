import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricardomejiastravieso/utils/theme.dart';
import 'package:ricardomejiastravieso/view/page/home.dart';
import 'package:url_strategy/url_strategy.dart';

import 'providers/theme_provider.dart';

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyProviders());
}

class MyProviders extends StatelessWidget {
  const MyProviders({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ricardo',
        scrollBehavior: MyCustomScrollBehavior().copyWith(scrollbars: false),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: Provider.of<ThemeProvider>(context, listen: true).mode,
        home: const HomePage(),
        builder: (context, child) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return Builder(builder: (context) {
                return child ?? const SizedBox.shrink();
              });
            },
          );
        });
  }
}

class MyCustomScrollBehavior extends CupertinoScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
