import 'package:flutter/material.dart';
import 'package:testflutter/custom_widgets/providers/base_provider.dart';
import 'package:testflutter/utils/color_constants.dart';

abstract class BaseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => getState();

  BaseWidgetState getState();

  const BaseWidget({Key? key}):super(key: key);
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T>
    implements OnNetListener {

  showLoading({bool isCloseOnClick: false})  {
    showDialog(
        context: context,
        builder: (context) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Scaffold(
                drawerEdgeDragWidth: 100,
                backgroundColor: ColorPlate.transparent,
                body: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: ShapeDecoration(
                        color: ColorPlate.blackOpacity,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)))),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: ColorPlate.yellow_ll,
                          color: ColorPlate.blue_clear,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "data",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: ColorPlate.yellow_ll),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  Future<void> dismissDialog() async {
    Navigator.of(context).pop();
  }

  /**
   * 标记异步方法数量
   */
  // var dialogCount = 0;

  @override
  void onStart() {
    showLoading();
    /*if (dialogCount==0) {
      showLoading();
    }
    if(dialogCount>=1){
      dialogCount=1;
    }else{
      dialogCount++;
    }*/
  }

  @override
  void onEnd() {
    dismissDialog();
    /*dialogCount--;
    if (dialogCount == 0) {
      dismissDialog();
    }*/
  }
}



