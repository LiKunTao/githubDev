import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("tianqi", () {
    //查找控件
    final counterTextFinder = find.byValueKey('tianqi');
     FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver?.close();
      }
    });

    test("tianqi", () async {
      //测试点击
     await driver?.tap(counterTextFinder);
     await Future.delayed(Duration(seconds: 3));
    });
    
  });
}
