import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(BuildContext context, String previewLink) async {
  if (previewLink.isNotEmpty) {
    final Uri url = Uri.parse(previewLink);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }
}
