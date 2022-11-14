import 'package:testflutter/custom_widgets/base_widget.dart';
import 'package:testflutter/custom_widgets/providers/base_provider.dart';

class TestProvider<T extends BaseWidgetState> extends BaseProvider {
  var _count = 0;

  Future<int> getNum() async {
    onNetListener.onStart();
    return await Future.delayed(Duration(seconds: 2), () {
      _count += 5;
      onNetListener.onEnd();
      return _count;
    });
  }

  Future<String> getStr() async {
    onNetListener.onStart();
    return await Future.delayed(Duration(seconds: 2), () {
      _count += 5;
      onNetListener.onEnd();
      return "${_count}";
    });
  }
}