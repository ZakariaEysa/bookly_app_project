import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        textAlign: TextAlign.center,
        message,
        style: Styles.textStyle18,
      ),
    );
  }
}
