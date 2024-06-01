import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class WBasicProviderState<T extends StatefulWidget,
    P extends ChangeNotifier> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<P>(
      create: (context) {
        return createViewModel(context);
      },
      child: widgetBuilder(),
    );
  }

  P createViewModel(BuildContext context);

  Widget widgetBuilder();

}
