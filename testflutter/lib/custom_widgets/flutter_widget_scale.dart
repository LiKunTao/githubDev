import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/custom_widgets/base_widget.dart';
import 'package:testflutter/utils/assets_image_utils.dart';
import 'package:testflutter/utils/color_constants.dart';

class FlutterWidgetScale extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return _FlutterWidgetScaleState();
  }

  const FlutterWidgetScale();
}

class _FlutterWidgetScaleState extends BaseWidgetState<FlutterWidgetScale> {
  var dx = 0.0;
  var dy = 0.0;
  var _width = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "天气",
        titleStyle: TextStyle(
            color: ColorPlate.blue_clear, fontWeight: FontWeight.bold),
        height: 40,
        titleBackgroundColor: ColorPlate.yellow_ll,
      ),
      body: Container(
        child: GestureDetector(
          onScaleUpdate: (detail) {
            _width = MediaQuery.of(context).size.width *
                detail.scale.clamp(0.1, 5.0);
          },
          child: Transform.translate(
            offset: Offset(dx, dy),
            child: Transform.scale(
              key: Key("image"),
              scale: 0.5,
              child: Container(
                  color: ColorPlate.yellow_ll,
                  child: Image.asset(
                    ImagePath.image_detail,
                    width: _width,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
