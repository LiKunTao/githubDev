import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testflutter/utils/color_constants.dart';

class LineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPlate.white,
      child: CustomPaint(
        painter: PaperPainter(
          context,
          ColorPlate.red,
        ),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  BuildContext context;
  Color color = ColorPlate.green;
  Paint painter = Paint();

  Path shadowPath = Path();
  double width = 0;
  double height = 0;

  final dex = 20;

  var dot = <Offset>[

  ];

  PaperPainter(this.context, this.color) {
    painter = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    init();
  }
   LinearGradient? linearGradient;
  void init() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    dot=[
      Offset(0, height/2),
      Offset(40, height/2-50),
      Offset(80, height/2-20),
      Offset(120, height/2+100),
      Offset(140, height/2-10),
      Offset(180, height/2-60),
      Offset(190, height/2-10),
      Offset(200, height/2-60),
      Offset(240, height/2+30),
      Offset(280, height/2-30),
      Offset(320, height/2-400),
      Offset(360, height/2+100),
      ];
    /**
     * 控制渐变的样式
     */
    linearGradient=LinearGradient(
        begin:Alignment.topCenter,end: Alignment.bottomCenter,
        colors: [ColorPlate.red, ColorPlate.transparent,ColorPlate.blue, ColorPlate.transparent],
        stops: [0.0,0.5,0.5,1.0]
    );
  }
double lowest=0.0;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPoints(
        PointMode.points, [Offset(width / 2, height / 2)], painter);
    // 绘制圆
    canvas.drawCircle(Offset(width / 2, height / 2), width / 4, painter);
    for (var i = 0; i <= width; i += dex) {
      for (var j = 0; j <= height; j += dex) {
        canvas.drawPoints(
            PointMode.points, [Offset(i.toDouble(), j.toDouble())], painter);
      }
    }


    shadowPath.moveTo(width / 2, height / 2);
    shadowPath.lineTo(width / 2 + width / 4, height / 2 + width / 4);
    shadowPath.lineTo(width / 2, height / 2 + width / 4);
    shadowPath.close();

    //三角形
    canvas.drawPath(
        shadowPath,
        painter
          ..strokeJoin = StrokeJoin.round
          ..strokeWidth = 20);
    canvas.drawShadow(shadowPath, color, 10, true);
    shadowPath.reset();

    canvas.drawLine(Offset(0,height/2), Offset(width,height/2), painter);
    canvas.drawLine(Offset(width/2,0), Offset(width/2,height), painter);

    canvas.drawPoints(
        PointMode.polygon,
        dot,
        painter
          ..style=PaintingStyle.fill
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 1);

    painter.shader = linearGradient?.createShader(Rect.fromLTWH(0.0, 0.0, width, height));

    canvas.drawRect(
        Rect.fromLTWH(
          0,
          0,
          width,
          height,
        ),
        painter);

    for (var i=0;i<dot.length;i++) {
      var pp=dot[i];
      if(lowest==0.0){
        lowest=pp.dy;
      }
      if(lowest>=pp.dy){
        lowest=pp.dy;
      }
      if(i==0){
        shadowPath.moveTo(pp.dx, pp.dy);
      }else if(i==dot.length-1){
        shadowPath.lineTo(pp.dx, pp.dy);
        shadowPath.lineTo(pp.dx, pp.dy+200);
        shadowPath.lineTo(lowest,pp.dy+200);
        shadowPath.lineTo(0,pp.dy+200);
        shadowPath.close();
      }else{
        shadowPath.lineTo(pp.dx, pp.dy);
      }
    }
    canvas.drawPath(shadowPath, painter);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
