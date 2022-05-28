import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_app/misc/colors.dart';
import 'package:sample_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;
  ResponsiveButton(
      {Key? key, this.width = 120, this.text = "", this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: AppText(
                color: Colors.white,
                text: text!,
              ),
            ),
            // Image.asset("arrow.png"),
            Image.network(
                "https://www.i2symbol.com/images/symbols/arrows/open_outlined_rightwards_arrow_u27BE_icon_48x48.png"),
          ],
        ),
      ),
    );
  }
}
