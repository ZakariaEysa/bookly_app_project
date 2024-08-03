import 'package:flutter/cupertino.dart';

import '../utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: Styles.textStyle18,
    );
  }
}
