import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(BuildContext context, String previewLink) async {
  final Uri url = Uri.parse(previewLink);

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }

  // if (previewLink.isNotEmpty) {
  //   print(previewLink);
  //
  //   final Uri url = Uri.parse(previewLink);
  //
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Could not launch $url')));
  //   }
  // }
}
