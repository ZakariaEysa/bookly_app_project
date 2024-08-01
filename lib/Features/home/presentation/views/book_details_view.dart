import 'package:bookly_app_project/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_checkout_outlined),
            ),
          ]),
      body: const SafeArea(child: BookDetailsViewBody()),
    );
  }
}
