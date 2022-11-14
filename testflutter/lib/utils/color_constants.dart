/*
 * @Author: Sumscope
 * @Date: 2021-12-10 13:46:13
 * @LastEditTime: 2021-12-31 17:43:36
 * @LastEditors: Sumscope
 * @Description: 
 * @FilePath: /qeubee_flutter/lib/common/constants/color_constants.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ColorPlate {
  /* 基本颜色 */
  static const Color transparent = const Color(0x00000000);
  static const Color background = const Color(0xff192a3b);
  static const Color meditationBackgroundItem = const Color(0xff193b6c);
  static const Color darkBackground = const Color.fromRGBO(12, 30, 51, 0.8);
  static const Color backgroundOpacity = const Color.fromRGBO(25, 42, 59, 0.8);
  static const Color black = const Color(0xff0A0F0E);
  static const Color blackGray = const Color(0xff121A19);
  static const Color blackOpacity = const Color(0xcc000000);
  static const Color white = const Color(0xffFFFFFF);
  static const Color darkGray = const Color(0xff999999);
  static const Color mediumGray = const Color(0xffccc);
  static const Color lightGray = const Color(0xffEEEEEE);
  static const Color blueGray = const Color(0xffACCAE8);
  static const Color lightBlueGray = const Color(0xffEFF1F0);
  static const Color canaryYellow = const Color(0xffFFECC6);
  static const Color greenGary = const Color(0xff193D37);
  static const Color red = const Color(0xffff0000);
  static const Color redLight = const Color(0x99ee0000);
  static const Color redLightEnd = const Color(0x22ee0000);
  static const Color orange = const Color(0xffFF5A00);
  static const Color yellow = const Color(0xffFFB100);
  static const Color yellow_ll = const Color(0xffF7CF3B);
  static const Color pink = const Color(0xffE92064);
  static const Color green = const Color(0xff009E86);
  static const Color greenOpacity = const Color(0xc9009E86);
  static const Color greenLight = const Color(0xff00B563);
  static const Color blue = const Color(0xff007FFF);
  static const Color blue_clear = const Color(0xff002e9b);
  static const Color blueLight = const Color(0xff2196F3);
  static const Color darkBlue = const Color(0xff4A4D4C);
  static const Color cyan = const Color(0xff37ABF9);
  static const Color gray = const Color(0xff8F9598);
  static const Color grayOpacity = const Color(0xcc8F9598);
  static const Color containerColor = const Color(0xff172422);
  static const Color containerColor1 = const Color(0xff173D37);
  static const Color tabSelectedColor = const Color(0xff0A6C5E);
  static const Color containerColor2 = const Color(0xff136C5E);
  static const Color dividerColor = const Color(0xff1B1F1F);
  static const Color upKLineColor = const Color(0xffB2302D); // "#B2302D";
  static const Color downKLineColor = const Color(0xff00A84B); //"#00A84B";
  static const Color redColor = const Color(0xffB2302D);
  static const Color greenf = const Color(0x6f009E86);

  //背景颜色
  static const Color backgroundblack = const Color(0xff121A19);

  static const Color popupboxbackground = const Color(0xff1B2121);
  static const Color popupboxdividingLine = const Color(0xff2D3836);
  static const Color popupboxdividingLinef = const Color(0x6f2D3836);
  static const Color popupboxdividingLined = const Color(0x9f2D3836);

  static const Color resetcolour = const Color(0xffF7F1CE);
  static const Color reminderBoxcolour = const Color(0xff131919);

  /// 深色背景
  static const Color back1 = const Color(0xff1D1F22);

  //Item
  static const Color itemcolour = const Color(0xff132121);
  static const Color itemcolourf = const Color(0x0f132121);

  static const Color tableBaseColour = const Color(0xff1A1F1F);

  //分割线
  static const Color dividingLine = const Color(0xff1C2222);

  /// 比深色背景略深一点
  static const Color back2 = const Color(0xff121314);

  /* 下方是具体组件使用的颜色 */
  static const Color titleBar = const Color(0xffF4511E);
  static const Color tabBar = const Color(0xffEEEEEE);

  static const Color inactive = const Color(0xff8F8F8F);
  static const Color active = const Color(0xffE92064);
  static const Color golden = const Color(0xffE2C592);

  // 涨跌平颜色
  static const Color downText = const Color(0xff00B563);
  static const Color upText = const Color(0xffFF333A);
  static const Color equalText = const Color(0xffFFECC8);
  static const Color equalBg = const Color(0xff777777);
  static const Color upBg = const Color(0xff00B563);
  static const Color downBg = const Color(0xffFF333A);
  static const Color bg = const Color(0xff121A19);
  static const Color listLine = const Color(0xff193D37);

  // label
  static const Color titleImp = const Color(0xffFFECC8);
  static const Color title = const Color(0xff6B6F71);
  static const Color titleImp1 = const Color(0xffFAC246);

  //折线图颜色
  static const Color withInterestRealTimeTrend = Color(0xff7846FA);
  static const Color backgroundColor = Color(0xff121A19);
  static const Color realTimeTrend = Color(0xffFAC246);
  static const Color withInterest = Color(0xff7846FA);

  //资金情绪
  static const Color bigCapitalColor = Color(0xff00B563);
  static const Color smallAndMediumCapitalColor = Color(0xff4CA3FB);
  static const Color nonBankColor = Color(0xff7846FA);

  //市场动态
  static const Color dealTypeBlueColor = Color(0xff005AFF);
  static const Color dealTypeorangeColor = Color(0xffFF5A00);
  static const Color dealType = Color(0xff48D1CC);
  static const Color dealTypegreenColor = Color(0xff00B563);

  static const Color dealBrokerAllgreenColor = Color(0xff0A6C5E);
  static const Color dealBrokerAllBlueColor = Color(0xff395EB8);
  static const Color dealBrokerAllredColor = Color(0xffC13D3A);
  static const Color dealBrokerAllorangeColor = Color(0xffE16622);
  static const Color dealBrokerAllPurpleColor = Color(0xff804BA7);
  static const Color dealBrokerAllgreen1Color = Color(0xff6EC05A);
  static const Color dealBrokerAllColor = Color(0xff22733d);
  static const Color lightGreyColor = Color(0xff4F4F4F);
  static const Color lightJJSBidColor = Color(0xffFFECC6);
}
