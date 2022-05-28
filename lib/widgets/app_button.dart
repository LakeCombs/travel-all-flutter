import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_app/misc/colors.dart';
import 'package:sample_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  String? text;
  IconData? icon;
  double size;
  bool isIcon;
  final Color borderColor;

  AppButtons(
      {Key? key,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      this.text = "h1",
      this.isIcon = false,
      this.icon,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Icon(icon, color: color),
    );
  }
}
