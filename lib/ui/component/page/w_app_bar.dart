import 'package:flutter/material.dart';

PreferredSizeWidget createAppBar(
  BuildContext context, {
  String? title,
  Color? titleColor,
  VoidCallback? onBackTap,
}) {
  return AppBar(
    title: Text(
      title ?? "",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: titleColor ?? Colors.black,
      ),
    ),
    leading: GestureDetector(
      onTap: () {
        if (onBackTap != null) {
          onBackTap.call();
          return;
        }
        Navigator.of(context).pop();
      },
      child: Image.asset(
        "images/icon_back.png",
        package: "wflutter_kit",
        color: Colors.black,
        height: 20,
        width: 20,
      ),
    ),
  );
}
