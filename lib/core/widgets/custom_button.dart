import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backGroundColor,
      required this.borderRadius,
      required this.text,
      required this.textColor,
      this.fontSize});

  final Color backGroundColor;
  final BorderRadiusGeometry borderRadius;
  final String text;
  final Color textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            backgroundColor: backGroundColor,
          ),
          child: Text(
            text,
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w900,
                color: textColor,
                fontSize: fontSize),
          )),
    );

    // return Container(
    //   alignment: Alignment.center,
    //   width: 170,
    //   height: 80,
    //   decoration: BoxDecoration(
    //     color: color,
    //     borderRadius: borderRadius,
    //   ),
    //   child: Text(
    //     text,
    //     style: style,
    //   ),
    // );
  }
}
