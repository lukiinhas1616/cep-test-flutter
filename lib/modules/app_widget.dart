import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../core/utils/listeners/statusbar_color_listener.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();

    Intl.defaultLocale = 'pt_BR';

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    Modular.to.addListener(
      () => StatusBarColorListener.defineProperStatusBarColorToRoute(
        route: Modular.to.path,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: const ColorScheme.light(
          primary: Color(0xff0030ff),
          secondary: Colors.blue,
          surface: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      title: 'Monetizze Test',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
