import 'package:flutter/material.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/custom_widgets/base_widget.dart';
import 'package:testflutter/custom_widgets/providers/test_provider.dart';
import 'package:testflutter/items/laomeng_item.dart';
import 'package:testflutter/models/data_model.dart';

class CustomBaseViewTest extends BaseWidget {
  @override
  State<StatefulWidget> createState() => _CustomBaseViewState();

  @override
  getState() {
    return _CustomBaseViewState();
  }

  const CustomBaseViewTest();
}

class _CustomBaseViewState extends BaseWidgetState<CustomBaseViewTest> {
  TestProvider? _provider;

  @override
  void initState() {
    _provider = TestProvider<_CustomBaseViewState>()..onNetListener = this;
    super.initState();
  }

  List<DataModel> dataStr = [];

  var aNum = 0;
  var str = "字符串";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'base',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: ListView.builder(
          itemCount: dataStr.length,
          itemBuilder: (BuildContext context, int index) => LaomengItem(
                index,
                dataStr[index].getContent(),
                (value) => () {},
                height: 30,
                fontSize: 14,
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: request,
        child: Text("按钮"),
      ),
    );
  }

  void request() {
    _provider?.getNum().then((value) => setState(() {
          aNum = value;
        }));
    _provider?.getStr().then((value) => setState(() {
          str = str + "${aNum}";
          dataStr.add(DataModel(str, aNum));
        }));
  }
}
