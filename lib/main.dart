import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/core/utils/colors_theme.dart';
import 'package:marketplace_nuconta/app/modules/home/home_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Marketplace NuConta',
      theme: ThemeData(
          accentColor: ColorsTheme.accent,
          primaryColor: ColorsTheme.primary,
          appBarTheme: AppBarTheme(
            color: ColorsTheme.primary,
          ),
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: ColorsTheme.accent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      );
  }
}