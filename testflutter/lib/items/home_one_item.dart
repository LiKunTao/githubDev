import 'package:flutter/material.dart';
import 'package:testflutter/utils/color_constants.dart';

class HomeOneItem extends StatefulWidget {
  int index;
  List<String> datas = [];
  Function call;

  HomeOneItem(this.index, this.datas, this.call);

  @override
  State<StatefulWidget> createState() {
    return _HomeOneItemState();
  }
}

class _HomeOneItemState extends State<HomeOneItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.call(widget.index);
      },
      onDoubleTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 4,left: 10,right: 10),
        padding: EdgeInsets.all(2),
        height: 60,
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Container(
                  height: 90,
                  child: Image.network(
                      "https://alifei02.cfp.cn/creative/vcg/veer/1600water/veer-169580801.jpg"),
                ),
                Text(
                  "这是${widget.datas[widget.index]}",
                  style: TextStyle(
                      color: ColorPlate.blue_clear,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(color: ColorPlate.blue_clear, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
    );
  }
}
