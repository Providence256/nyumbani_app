import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

/// A helper [AsyncValue] extension to show a toast notification on error

extension AsyncValueUI on AsyncValue {
  void showToastNotificationError() {
    if (!isLoading && hasError) {
      final message = _errorMessage(error);
      toastification.show(
        type: ToastificationType.error,
        title: Text(message),
        autoCloseDuration: Duration(seconds: 2),
        style: ToastificationStyle.fillColored,
        alignment: Alignment.bottomLeft,
      );
    }
  }

  String _errorMessage(Object? error) {
    if (error is FirebaseAuthException) {
      return error.message ?? error.toString();
    } else {
      return error.toString();
    }
  }
}
