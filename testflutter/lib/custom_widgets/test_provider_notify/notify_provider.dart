import 'package:flutter/material.dart';

class NotifyProvider extends ChangeNotifier {
  var counter = 0;
  final _netStr = ["data_default"];

  List<String> get netStr => _netStr;

  Future<void>getNetData() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      counter++;
      _netStr.add("data_from_net_$counter");
      notifyListeners();
    });
  }
}
