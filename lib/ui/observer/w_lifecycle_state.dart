import 'dart:ui';

import 'package:flutter/material.dart';

abstract class WLifecycleState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onPageResume();
    } else if (state == AppLifecycleState.paused) {
      onPagePause();
    }
  }

  void onPageResume();

  void onPagePause();
}
