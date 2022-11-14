import 'package:flutter/material.dart';
import 'package:testflutter/utils/color_constants.dart';

class LaomengItem extends StatefulWidget {
  int index;
  double fontSize;
  double height;

  String datas = "[]";
  Function call;

  LaomengItem(this.index, this.datas, this.call, {this.height = 60,this.fontSize = 20});

  @override
  State<StatefulWidget> createState() {
    return _LaomengItemState();
  }
}

class _LaomengItemState extends State<LaomengItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.call(widget.index);
      },
      onDoubleTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 4, left: 10, right: 10),
        padding: EdgeInsets.all(2),
        height: widget.height,
        child: Text(
          "这是${widget.datas}",
          style: TextStyle(
              color: ColorPlate.yellow_ll,
              fontSize: widget.fontSize,
              fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: ColorPlate.blue_clear, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
    );
  }
}
