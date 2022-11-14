import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/constants/unit_router.dart';
import 'package:testflutter/items/home_one_item.dart';
import 'package:testflutter/utils/color_constants.dart';

class HomeStickyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeStickyPageState();
}

class _HomeStickyPageState extends State<HomeStickyPage> {
  var datas = [
    "测试界面跳转",
    "java",
    "老孟",
    "手势识别",
    "封装",
    "flutter->java",
    "R",
    "php",
    ".net"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        /*titleLeading: Container(
          width: 10,
          height: 10,
          child: Image.asset(
            ImagePath.icon_back,
          ),
        ),
        onBack: () {
          toast("粘性头部");
        },*/
        titleLeading: const SizedBox(),
        titleBackgroundColor: ColorPlate.yellow_ll,
        title: "粘性头部",
        height: 40,
        titleStyle:const TextStyle(
            color: ColorPlate.blue_clear, fontWeight: FontWeight.bold),
      ),
      body: ListView.builder(
          itemCount: datas.length,
          itemBuilder: (context, index) {
            return StickyHeader(
              header: Container(
                color: ColorPlate.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '头布局:$index',
                  style: const TextStyle(
                      color: ColorPlate.yellow_ll, fontWeight: FontWeight.bold),
                ),
              ),
              content: HomeOneItem(index, datas, (value) {
                switch (value) {
                  case 0:
                    Navigator.of(context).pushNamed(UnitRouter.one_page);
                    break;
                  case 1:
                    Navigator.of(context).pushNamed(UnitRouter.custom_paint_widget);
                    break;
                  case 2:
                    Navigator.of(context).pushNamed(UnitRouter.laomeng_widget);
                    break;
                  case 3:
                    Navigator.of(context).pushNamed(UnitRouter.gesture_detector_detail);
                    break;
                  case 4:
                    Navigator.of(context).pushNamed(UnitRouter.custom_base_widget);
                    break;
                  case 5:
                    Navigator.of(context).pushNamed(UnitRouter.flutter_to_java_kotlin);
                    break;
                  case 6:
                    Navigator.of(context).pushNamed(UnitRouter.flutter_widget_scale);
                    break;
                  default:
                    Navigator.of(context).pushNamed(UnitRouter.show_local_file,arguments: "/storage/emulated/0/Android/data/com.sumscope.qeubee.mobile/files/QBfile/11232.xlsx");
                    break;
                }
              }),
            );
          }),
    );
  }
}
