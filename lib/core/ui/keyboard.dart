import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void requestKeyboardFocus(BuildContext context, FocusNode node) {
  if (!node.hasFocus) {
    FocusScope.of(context).requestFocus(node);
  }

  // Delay the show call until after focus settles to avoid IME race conditions.
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!context.mounted) return;
    if (!node.hasFocus) {
      FocusScope.of(context).requestFocus(node);
    }
    SystemChannels.textInput.invokeMethod<void>('TextInput.show');
  });

  Future<void>.delayed(const Duration(milliseconds: 80), () {
    if (!context.mounted) return;
    if (node.hasFocus) {
      SystemChannels.textInput.invokeMethod<void>('TextInput.show');
    }
  });
}
