import 'package:flutter/cupertino.dart';
import 'package:testflutter/custom_painter/line_widget.dart';

class OnePage extends StatefulWidget{

  const OnePage({Key? key}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
}

class _TestState extends State<OnePage>{
  @override
  Widget build(BuildContext context) {
    return Container(child: LineWidget(),);
  }

}

