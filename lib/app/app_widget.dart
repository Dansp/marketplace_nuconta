import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/utils/colors_theme.dart';
import 'core/utils/translations.dart';

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MaterialApp(
        title: 'Marketplace NuConta',
        initialRoute: Modular.initialRoute,
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
        localizationsDelegates: [
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale(
            'en',
            '',
          ),
          const Locale(
            'pt',
            '',
          ),
        ],
        debugShowCheckedModeBanner: false,
      ).modular();
    });
  }
}
