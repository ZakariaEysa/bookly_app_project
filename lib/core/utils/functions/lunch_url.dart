import '../../../Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(BuildContext context, BookModel bookModel) async {
  if (bookModel.volumeInfo?.previewLink != null) {
    final Uri url = Uri.parse(bookModel.volumeInfo?.previewLink ?? '');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }
}
