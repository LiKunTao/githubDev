import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/custom_widgets/base_widget.dart';
import 'package:testflutter/utils/assets_image_utils.dart';
import 'package:testflutter/utils/color_constants.dart';

class FlutterToJavaKotlin extends BaseWidget {
  @override
  State<StatefulWidget> createState() => _FlutterToJavaKotlinState();

  @override
  getState() {
    return _FlutterToJavaKotlinState();
  }

  const FlutterToJavaKotlin({Key? key}) : super(key: key);
}

class _FlutterToJavaKotlinState extends BaseWidgetState<FlutterToJavaKotlin> {
  MethodChannel _methodChannel = MethodChannel("ace_demo_android_flutter");
  File? _avatarFile;

  @override
  void initState() {
    super.initState();
    _methodChannel.setMethodCallHandler((call) {
      if (call.method == "imagePath") {
        setState(() {
          String path = call.arguments.toString().substring(7);
          _avatarFile = File(path);
        });
      }
      return Future(() {});
    });
    /*super.initState();
    _methodChannel.setMethodCallHandler((call) {
      if (call.method == 'imagePath') {
        setState(() {
          //获取图片本地路径并进行截取
          String imagePath = call.arguments.toString().substring(7);
          _avatarFile = File(imagePath);
        });
      }
      return Future((){});
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleBackgroundColor: ColorPlate.blue_clear,
        title: "flutter->kotlin",
        onBack: back,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  _methodChannel.invokeMapMethod("picture");
                },
                child: Container(
                    color: ColorPlate.yellow_ll,
                    child: _avatarFile == null
                        ? Image.asset(ImagePath.icon_qq)
                        : Image.file(_avatarFile!)),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: ColorPlate.blue_clear,
              ))
        ],
      ),
    );
  }

  back() async {
    Navigator.of(context).pop();
  }
}
