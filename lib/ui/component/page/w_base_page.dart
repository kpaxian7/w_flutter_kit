import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'package:wflutter_kit/ui/observer/w_lifecycle_state.dart';
import 'package:wflutter_kit/ui/view_model/w_notifier.dart';

/// appbar builder
typedef AppBarBuilder = PreferredSizeWidget Function(BuildContext context);

typedef PageVisibleChanged = void Function(BuildContext context);

abstract class WBasePage extends StatelessWidget {
  const WBasePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget>? vmList = createViewModel(context);

    Widget baseBuilder = Builder(
      builder: (ctx) {
        return WBaseInnerPage(
          bodyWidget: bodyBuilder(ctx),
          appbarWidget: appbarBuilder(ctx),
          scaffoldColor: backgroundColor(),
          onPageResume: onPageResume,
          onPagePause: onPagePause,
        );
      },
    );

    if (vmList?.isNotEmpty ?? false) {
      return MultiProvider(
        providers: vmList!,
        child: baseBuilder,
      );
    } else {
      return baseBuilder;
    }
  }

  List<SingleChildWidget>? createViewModel(BuildContext context) {
    return null;
  }

  PreferredSizeWidget? appbarBuilder(BuildContext context) {
    return null;
  }

  Widget bodyBuilder(BuildContext context);

  void onPageResume(BuildContext context) {}

  void onPagePause(BuildContext context) {}

  void processLogic() {}

  Color backgroundColor() {
    return Colors.white;
  }
}

class WBaseInnerPage extends StatefulWidget {
  final Widget bodyWidget;

  final PreferredSizeWidget? appbarWidget;
  final Color? scaffoldColor;
  final PageVisibleChanged? onPageResume;
  final PageVisibleChanged? onPagePause;
  final Function? processLogicFunc;

  const WBaseInnerPage({
    required this.bodyWidget,
    this.appbarWidget,
    this.scaffoldColor,
    this.onPageResume,
    this.onPagePause,
    this.processLogicFunc,
    super.key,
  });

  @override
  State<WBaseInnerPage> createState() => _WBaseInnerPageState();
}

class _WBaseInnerPageState extends WLifecycleState<WBaseInnerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.processLogicFunc?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.scaffoldColor,
      appBar: widget.appbarWidget,
      body: widget.bodyWidget,
    );
  }

  @override
  void onPagePause() {
    widget.onPagePause?.call(context);
  }

  @override
  void onPageResume() {
    widget.onPageResume?.call(context);
  }
}
