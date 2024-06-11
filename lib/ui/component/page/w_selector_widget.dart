import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class WSelectorWidget<E, P extends ChangeNotifier>
    extends StatelessWidget {
  const WSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<P, E>(
      selector: (ctx, p) {
        return selectorParams(p);
      },
      builder: (ctx, val, child) {
        return buildBodyWidget(ctx, val);
      },
      shouldRebuild: shouldRebuild,
    );
  }

  E selectorParams(P p);

  Widget buildBodyWidget(BuildContext context, E value);

  bool shouldRebuild(previous, next) {
    return previous != next;
  }
}
