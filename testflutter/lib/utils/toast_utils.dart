import 'package:flutter/src/foundation/key.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/utils/color_constants.dart';

toast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      textColor: ColorPlate.white,
      gravity:ToastGravity.CENTER,
      fontSize: 14,
      backgroundColor: ColorPlate.black);
}

toastFromLibrary(String msg,{String, required Key textKey }) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      textColor: ColorPlate.white,
      gravity:ToastGravity.CENTER,
      fontSize: 14,
      backgroundColor: ColorPlate.black);
}