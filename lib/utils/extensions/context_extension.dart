import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void showSnackBar(String message) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          dismissDirection: DismissDirection.down,
        ),
      );

  void showLoading() => showDialog(
        context: this,
        barrierDismissible: false,
        builder: (context) {
          return const PopScope(
            canPop: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );

  void hideLoading() => Navigator.of(this).pop();
}
