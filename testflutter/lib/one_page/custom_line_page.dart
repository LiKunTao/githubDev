import 'package:flutter/cupertino.dart';
import 'package:testflutter/custom_painter/custome_line_widget.dart';
import 'package:testflutter/custom_painter/line_widget.dart';

class CustomLinePage extends StatefulWidget{

  const CustomLinePage({Key? key}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomLineState();
  }
}

class _CustomLineState extends State<CustomLinePage>{
  @override
  Widget build(BuildContext context) {
    return Container(child: CustomLineWidget(),);
  }

}

