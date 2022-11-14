import 'package:flutter/material.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/utils/assets_image_utils.dart';
import 'package:testflutter/utils/color_constants.dart';

class HomeWeatherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeWeatherPageState();
}

class _HomeWeatherPageState extends State<HomeWeatherPage> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleLeading: const SizedBox(),
        title: "天气",
        titleStyle: const TextStyle(
            color: ColorPlate.blue_clear, fontWeight: FontWeight.bold),
        height: 40,
        titleBackgroundColor: ColorPlate.yellow_ll,
      ),
      body: Column(children: [
        Listener(
          /**
           * 默认的behavior=deferToChild只能点击子控件；
           * behavior: HitTestBehavior.translucent,表示可以击穿；
           * HitTestBehavior.opaque可以监听整个控件的点击Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,)
           */
          behavior: HitTestBehavior.opaque,

          child: Container(
            alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            child: Text("${_event.toString()}"),
          ),
          onPointerDown: (onPointerDown) => update(onPointerDown),
          onPointerMove: (onPointerMove) => update(onPointerMove),
          onPointerUp: (onPointerUp) => update(onPointerUp),
          onPointerCancel: (onPointerCancel) => update(onPointerCancel),
        ),
      ],),
    );
  }

  void update(PointerEvent? p){
    setState(() {
      _event=p;
    });
  }
}
