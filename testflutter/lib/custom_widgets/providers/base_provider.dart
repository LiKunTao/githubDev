import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  OnNetListener? _onNetListener;

  OnNetListener get onNetListener => _onNetListener!;

  set onNetListener(OnNetListener value) {
    _onNetListener = value;
  }
}


abstract class OnNetListener {
  void onStart();

  void onEnd();
}