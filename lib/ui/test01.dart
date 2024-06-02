import 'package:flutter/material.dart';
import 'package:wflutter_kit/ui/view_model/w_notifier.dart';

// class Test01Page<T extends WNotifier> extends StatelessWidget {
//   const Test01Page({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class BaseOuterWidget extends InheritedWidget {
  const BaseOuterWidget({
    super.key,
    required Widget child,
  }) : super(child: child);

  static BaseOuterWidget of(BuildContext context) {
    final BaseOuterWidget? result =
        context.findAncestorWidgetOfExactType<BaseOuterWidget>();
    assert(result != null, 'No BaseOuterWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BaseOuterWidget old) {
    return false;
  }
}
