import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String error) {
  return SnackBar(
    backgroundColor: Colors.white,
    content: Text(
      textAlign: TextAlign.center,
      error,
      style: const TextStyle(color: Colors.black),
    ),
    duration: const Duration(seconds: 3),
  );
}
