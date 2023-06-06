import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackbarWidget {
  showsnackbar(String message, context) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
