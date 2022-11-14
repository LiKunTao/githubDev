import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testflutter/custom_widgets/custome_base_test.dart';
import 'package:testflutter/custom_widgets/flutter_java_kotlin/flutter_java_kotlin.dart';
import 'package:testflutter/custom_widgets/flutter_widget_scale.dart';
import 'package:testflutter/custom_widgets/gesture_detector_detail.dart';
import 'package:testflutter/custom_widgets/image_detail_page.dart';
import 'package:testflutter/custom_widgets/local_file.dart';
import 'package:testflutter/laomeng/views/chip_page.dart';
import 'package:testflutter/laomeng/views/laomeng_page.dart';
import 'package:testflutter/one_page/custom_line_page.dart';
import 'package:testflutter/one_page/one_page.dart';

class UnitRouter {
  /**
   * 跳转界面
   */
  static const String one_page = 'one_page';

  /**
   * 自定义控件
   */
  static const String custom_paint = 'custom_paint';
  /**
   * 自定义折线图
   */
  static const String custom_paint_widget = 'custom_paint_widget';

  /**
   * 老孟flutter入门
   */
  static const String laomeng_widget = 'laomeng_widget';

  /**
   * chip使用
   */
  static const String laomeng_widget_chip = 'laomeng_widget_chip';

  /**
   * baseView测试
   */
  static const String custom_base_widget = 'custom_base_widget';


  /**
   * 测试flutter调用原生kotlin或者java
   */
  static const String flutter_to_java_kotlin = 'flutter_to_java_kotlin';


  /**
   * 控件缩放
   */
  static const String flutter_widget_scale = 'flutter_widget_scale';

  /**
   * 手势识别
   */
  static const String gesture_detector_detail = 'gesture_detector_detail';

  /**
   * 手势识别
   */
  static const String show_local_file = 'show_local_file';

  /**
   * 手势识别
   */
  static const String image_detail_page = 'image_detail_page';

  static Map<String, WidgetBuilder> routerList = {
    one_page: (BuildContext context) => const OnePage(),
    custom_paint: (BuildContext context) => const OnePage(),
    custom_paint_widget: (BuildContext context) => const CustomLinePage(),
    laomeng_widget: (BuildContext context) => const LaomengPage(),
    laomeng_widget_chip: (BuildContext context) => const ChipPage(),
    custom_base_widget: (BuildContext context) => const CustomBaseViewTest(),
    flutter_to_java_kotlin: (BuildContext context) => const FlutterToJavaKotlin(),
    gesture_detector_detail: (BuildContext context) => const GestureWidget(),
    flutter_widget_scale: (BuildContext context) => const FlutterWidgetScale(),
    show_local_file: (BuildContext context) => const FlutterWidgetLocalFile(),
    image_detail_page: (BuildContext context) =>  ImageDetailPage(),
  };
}