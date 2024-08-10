import 'package:bookly_app_project/Features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String error) {
  return SnackBar(
    backgroundColor: Colors.white,
    content: Text(
      textAlign: TextAlign.center,
      error,
      style: TextStyle(color: Colors.black),
    ),
    duration: const Duration(seconds: 3),
  );
}
