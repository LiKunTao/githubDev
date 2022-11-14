import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/custom_widgets/base_widget.dart';
import 'package:testflutter/utils/assets_image_utils.dart';
import 'package:testflutter/utils/color_constants.dart';
import 'package:testflutter/utils/logutils.dart';

import 'event/event_bus.dart';

class GestureWidget extends BaseWidget {
  const GestureWidget({Key? key}) : super(key: key);

  @override
  BaseWidgetState<BaseWidget> getState() {
    return _GestureWidgetState();
  }
}

class _GestureWidgetState extends BaseWidgetState<GestureWidget> {
  double _top = 0.0;
  double _left = 0.0;
  double _width = 200;
  double _height = 200;

  bool _tlggle = false;
  var te="";

  @override
  void initState() {
    super.initState();
    bus.busOn("eventName", (arg) {
      setState(() {
        te=arg.toString();
        d("${te}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Guesture",
        titleBackgroundColor: ColorPlate.blue_clear,
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(text: "大家好"),
                TextSpan(
                    text: te,
                    style: TextStyle(
                        fontSize: 30,
                        color: _tlggle
                            ? ColorPlate.blue_clear
                            : ColorPlate.yellow_ll),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          _tlggle = !_tlggle;
                        });
                      }),
                TextSpan(text: "大家好"),
                TextSpan(text: "大家好"),
              ])),

            ],
          ),
          Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: Image.asset(
                  ImagePath.image_detail,
                  width: _width,
                  height: _height,
                ),
                /*onPanDown: (DragDownDetails d){

                },*/
                /*onPanUpdate: (DragUpdateDetails d){
                  setState(() {
                    _top+=d.delta.dy;
                    _left+=d.delta.dx;

                  });
                },*/
                onScaleEnd: (ScaleEndDetails detail) {},
                onScaleUpdate: (ScaleUpdateDetails detail) {
                  setState(() {
                    _top += detail.focalPointDelta.dy;
                    _left += detail.focalPointDelta.dx;
                    _width = 200 * detail.scale.clamp(0.1, 100.0);
                    _height = 200 * detail.scale.clamp(0.1, 100.0);
                  });
                },
              )),
        ],
      ),
    );
  }
}
