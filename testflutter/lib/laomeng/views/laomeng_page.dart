import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/constants/unit_router.dart';
import 'package:testflutter/items/laomeng_item.dart';
import 'package:testflutter/utils/assets_image_utils.dart';
import 'package:testflutter/utils/color_constants.dart';
import 'package:testflutter/utils/toast_utils.dart';

class LaomengPage extends StatefulWidget {
  const LaomengPage();

  static final List<String> data = [
    "AboutDialog",
    "Chip",
    "AlertDialog",
    "CupertinoAlertDialog"
  ];

  @override
  State<StatefulWidget> createState() {
    return _LaomengState();
  }
}

class _LaomengState extends State<LaomengPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:CustomAppBar(height: 50,title:"title",localActions:Image.asset(ImagePath.icon_copylink),onTap: (){toast("onTap");},),
        body: ListView.builder(
            itemCount: LaomengPage.data.length,
            itemBuilder: (BuildContext context, int index) => LaomengItem(
                index, LaomengPage.data[index], (value) => _switchIndex(index))
              ..height = 40
              ..fontSize = 12));
  }

  void _switchIndex(int index) {
    switch (index) {
      case 0:
        _showAboutDialog();
        break;
      case 1:
        Navigator.of(context).pushNamed(UnitRouter.laomeng_widget_chip);
        break;
      case 2:
        showCustomDialog();
        break;
      case 3:
        showCupertinoAlertDialog();
        break;
    }
  }

  void _showAboutDialog() {
    showAboutDialog(
        context: context,
        applicationName: "老孟",
        applicationVersion: "1.0.0",
        applicationLegalese: "十步杀一人，千里不留行。",
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 36,
            color: ColorPlate.red,
            child: Text(
              "噫吁嚱，危乎高哉！蜀道之难，难于上青天！",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 30,
            color: ColorPlate.blue_clear,
            child: Text(
              "蚕丛及鱼凫，开国何茫然！",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 30,
            color: ColorPlate.yellow_ll,
            child: Text(
              "尔来四万八千岁，不与秦塞通人烟。",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 30,
            color: ColorPlate.red,
            child: Text(
              "西当太白有鸟道，可以横绝峨眉巅。",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 30,
            color: ColorPlate.green,
            child: Text(
              "地崩山摧壮士死，然后天梯石栈相钩连。",
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
        applicationIcon: Image.asset(
          ImagePath.icon_qq,
          width: 100,
          height: 100,
        ));
  }

  void showCustomDialog() async {
    var result = await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (con) {
          return AlertDialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            backgroundColor: ColorPlate.red,
            content: Text("这是内容！"),
            actions: [
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop("取消");
                },
              ),
              FlatButton(
                child: Text("确认"),
                onPressed: () {
                  Navigator.of(context).pop("确认");
                },
              )
            ],
          );
        });
    toast("${result}");
  }

  void showCupertinoAlertDialog() async {
    var res = await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("IOS风格"),
            content: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 36,
                  color: ColorPlate.red,
                  child: Text(
                    "噫吁嚱，危乎高哉！蜀道之难，难于上青天！",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  color: ColorPlate.blue_clear,
                  child: Text(
                    "蚕丛及鱼凫，开国何茫然！",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  color: ColorPlate.yellow_ll,
                  child: Text(
                    "尔来四万八千岁，不与秦塞通人烟。",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  color: ColorPlate.red,
                  child: Text(
                    "西当太白有鸟道，可以横绝峨眉巅。",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  color: ColorPlate.green,
                  child: Text(
                    "地崩山摧壮士死，然后天梯石栈相钩连。",
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop("取消");
                },
              ),
              CupertinoDialogAction(
                child: Text('确认'),
                onPressed: () {
                  Navigator.of(context).pop("确认");
                },
              ),
            ],
          );
        });
    toast(res);
  }
}
