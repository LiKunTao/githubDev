import 'package:flutter/material.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/constants/unit_router.dart';
import 'package:testflutter/custom_widgets/base_widget.dart';
import 'package:testflutter/custom_widgets/event/event_bus.dart';
import 'package:testflutter/utils/color_constants.dart';
import 'package:testflutter/utils/logutils.dart';

class HomeTechnologyPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return _HomeTechnologyPageState();
  }
}

class _HomeTechnologyPageState extends BaseWidgetState<HomeTechnologyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleLeading: const SizedBox(),
          title: "科技",
          titleStyle: const TextStyle(
              color: ColorPlate.blue_clear, fontWeight: FontWeight.bold),
          height: 40,
          titleBackgroundColor: ColorPlate.yellow_ll,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                child: Container(
                  width: 60,
                  height: 60,
                  child: const Text("按钮1212"),
                ),
                onTap: () {
                  //todo:在gesture_detector_detail界面展示数据
                  emit();
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  return false;
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(UnitRouter.image_detail_page);
                          },
                          behavior: HitTestBehavior.opaque,
                          child: SizedBox(
                            height: 60,
                            child: Text("$index"),
                          ));
                    }),
              ),
            ),
          ],
        ));
  }

  var count = 1;

  void emit() {
    Future.delayed(Duration(seconds: 2), () {
      bus.emit("eventName", [count++]);
      d("${count}");
      emit();
    });
  }

  @override
  void dispose() {
    bus.busOff("eventName", []);
    super.dispose();
  }
}
