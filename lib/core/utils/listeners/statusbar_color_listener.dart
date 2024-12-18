import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarColorListener {
  const StatusBarColorListener();

  static void defineProperStatusBarColorToRoute({String? route}) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
