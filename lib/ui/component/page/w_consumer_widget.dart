import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class WConsumerWidget<P extends ChangeNotifier>
    extends StatelessWidget {
  const WConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<P>(
      builder: (ctx, vm, child) {
        return buildBodyWidget(context, vm);
      },
    );
  }

  Widget buildBodyWidget(BuildContext context, P viewModel);
}
