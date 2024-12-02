import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String errorMessage) {
  return SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      errorMessage,
      style: const TextStyle(color: Colors.white),
    ),
    action: SnackBarAction(
      label: 'Dismiss',
      onPressed: () {},
    ),
  );
}
