import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'package:wflutter_kit/ui/observer/w_lifecycle_state.dart';
import 'package:wflutter_kit/ui/view_model/w_notifier.dart';

/// appbar builder
typedef AppBarBuilder = PreferredSizeWidget Function(BuildContext context);

typedef PageVisibleChanged = Function(BuildContext context);

class WBasePage extends StatelessWidget {
  final WidgetBuilder bodyBuilder;
  final List<WNotifier> providers;

  final AppBarBuilder? appBarBuilder;
  final Color? scaffoldColor;
  final PageVisibleChanged? onPageResume;
  final PageVisibleChanged? onPagePause;

  const WBasePage({
    required this.bodyBuilder,
    required this.providers,
    this.appBarBuilder,
    this.scaffoldColor,
    this.onPageResume,
    this.onPagePause,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> providerWidgets = providers
        .map((e) => ChangeNotifierProvider(create: (ctx) {
              return e;
            }))
        .toList();
    return MultiProvider(
      providers: providerWidgets,
      child: WBaseInnerPage(
        bodyBuilder: bodyBuilder,
        providers: providers,
        appBarBuilder: appBarBuilder,
        scaffoldColor: scaffoldColor,
        onPageResume: onPageResume,
        onPagePause: onPagePause,
      ),
    );
  }
}

class WBaseInnerPage extends StatefulWidget {
  final WidgetBuilder bodyBuilder;
  final List<WNotifier> providers;

  final AppBarBuilder? appBarBuilder;
  final Color? scaffoldColor;
  final PageVisibleChanged? onPageResume;
  final PageVisibleChanged? onPagePause;

  const WBaseInnerPage({
    required this.bodyBuilder,
    required this.providers,
    this.appBarBuilder,
    this.scaffoldColor,
    this.onPageResume,
    this.onPagePause,
    super.key,
  });

  @override
  State<WBaseInnerPage> createState() => _WBaseInnerPageState();
}

class _WBaseInnerPageState extends WLifecycleState<WBaseInnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.scaffoldColor,
      appBar: widget.appBarBuilder?.call(context),
      body: widget.bodyBuilder.call(context),
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
