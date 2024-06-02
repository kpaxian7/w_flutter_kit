import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wflutter_kit/ui/view_model/w_notifier.dart';

abstract class WBasicProviderState<T extends StatefulWidget,
    P extends WNotifier> extends State<T> {
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

  @override
  void dispose() {
    context.read<P>().dispose();
    super.dispose();
  }
}
