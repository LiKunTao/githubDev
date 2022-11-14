import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:testflutter/utils/color_constants.dart';
import 'package:testflutter/models/model_line_data.dart';

class CustomLineWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPlate.white,
      child: CustomPaint(
        painter: LinePainter(
          context,
          ColorPlate.blue,
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {

  static final String tag = "LinePainter";

  BuildContext context;
  Color? color ;
  Paint painter = Paint();

  Path shadowPath = Path();
  double width = 0;
  double height = 0;

  final dex = 20;

  var dot = <Offset>[];

  LinePainter(this.context, this.color) {
    painter = Paint()
      ..color = color!
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    init();
  }

  Shader? linearGradient;

  void init() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    delJson();

    /**
     * 控制渐变的样式
     */
    linearGradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          ColorPlate.blue,
          ColorPlate.transparent,
        ],
        stops: [
          0.0,
          0.5,
        ]).createShader(Rect.fromLTWH(0.0, 0.0, width, height));
  }

  void delJson() {
    rootBundle.loadString("assets/data/line_data.json").then((value) {
      var map = json.decode(value); // 解码
      ModelLineData modelLineData = ModelLineData();
      modelLineData.status = map['status'];
      modelLineData.message = map['message'];
      modelLineData.content = [];
      map['content'].forEach((ele) {
        var content = Content();
        content.type = ele['type'];
        content.bp = ele['bp'];
        content.price = ele['price'];
        content.createTime = ele['createTime'];
        content.lineData = [];
        ele['lineData'].forEach((lineDataDy) {
          var lineData = LineData();
          lineData.y = lineDataDy['y'];
          lineData.x = lineDataDy['x'];
          lineData.ts = lineDataDy['ts'];
          content.lineData?.add(lineData);
        });
        modelLineData.content?.add(content);
      });
      initDot(modelLineData);
    });
  }


  void initDot(ModelLineData modelLineData) {
    double yHeightest = 0.0;
    double xSpace = width / ((modelLineData.content?[0].lineData?.length)!.toDouble()-1);
    var aNum = 0;
    modelLineData.content?[0].lineData?.forEach((element) {
      var y = double.parse(element.y!);
      if (y >= yHeightest) {
        yHeightest = y;
      }
    });
    modelLineData.content?[0].lineData?.forEach((element) {
      var y = double.parse(element.y!);
      dot.add(Offset(aNum * xSpace, (y / yHeightest) * 300 + height / 2 - 300));
      aNum++;
    });
  }

  @override
  void paint(Canvas canvas, Size size) {

    painter
      ..shader=linearGradient
      ..strokeWidth = 1;

    canvas.drawPoints(
        PointMode.polygon,
        dot,
        painter);

    canvas.drawRect(
        Rect.fromLTWH(
          0,
          0,
          width,
          height,
        ),
        painter);

    for (var i = 0; i < dot.length; i++) {
      var pp = dot[i];
      if (i == 0) {
        shadowPath.moveTo(pp.dx, pp.dy);
      } else if (i == dot.length - 1) {
        shadowPath.lineTo(pp.dx, pp.dy);
        shadowPath.lineTo(width, height/2);
        shadowPath.close();
      } else {
        shadowPath.lineTo(pp.dx, pp.dy);
      }
    }
    canvas.drawPath(shadowPath, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
