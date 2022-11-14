import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/custom_widgets/test_provider_notify/notify_provider.dart';
import 'package:testflutter/utils/color_constants.dart';

class NotifyPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'test_notify',
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext buildContext) => NotifyProvider(),
        // child: NotifyPage()
        child: Builder(
          builder: (context) => NotifyPage(),
          // builder: (context) => NotifyPageConsumerPage(),
          // builder: (context) => NotifyPageConsumerReadPage(),
        ),
      ),
    );
  }
}

class NotifyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotifyPageState();
  }
}

///通过context.watch<MyNotifyProvider>();监听数据，
class NotifyPageState extends State<NotifyPage> {
  final ScrollController _scrollController=ScrollController();
  NotifyProvider _notifyProvider = NotifyProvider();
  final double _itemHeight=30;

  @override
  void initState() {
    super.initState();
    Provider.of<NotifyProvider>(context, listen: false).getNetData();
  }

  @override
  Widget build(BuildContext context) {
    _notifyProvider = context.watch<NotifyProvider>();
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: _notifyProvider.netStr.length,
                itemBuilder: (context, index) =>
                    Container(
                      child: Text(_notifyProvider.netStr[index]),
                      height: _itemHeight,
                    ))),
        FloatingActionButton(
          onPressed: () {
            _notifyProvider.getNetData();
            _scrollController.animateTo(_itemHeight*(_notifyProvider.netStr.length), duration: const Duration(microseconds: 200), curve: Curves.linear);
          },
          child: const Text(
            "新增S",
            style: TextStyle(fontSize: 20, color: ColorPlate.red),
          ),
        ),
      ],
    );
  }
}

class NotifyPageConsumerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotifyPageConsumerPageState();
  }
}

///通过Provider.of<T>获取provider，并通过Consumer监听数据刷新
class NotifyPageConsumerPageState extends State<NotifyPageConsumerPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<NotifyProvider>(context, listen: false).getNetData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Consumer(
              builder:
                  (BuildContext context, NotifyProvider provider, child) {
                return ListView.builder(
                    itemCount: provider.netStr.length,
                    itemBuilder: (context, index) =>
                        Text(provider.netStr[index]));
              },
            )),
        FloatingActionButton(
          onPressed: () {
            Provider.of<NotifyProvider>(context, listen: false).getNetData();
          },
          child: const Text(
            "新增C",
            style: TextStyle(fontSize: 20, color: ColorPlate.red),
          ),
        )
      ],
    );
  }
}

class NotifyPageConsumerReadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotifyPageConsumerReadPageState();
  }
}

///通过read的方式获取provider并获取网路数据，通过Consumer监听数据
class NotifyPageConsumerReadPageState extends State<NotifyPageConsumerReadPage> {

  @override
  Widget build(BuildContext context) {
    print("NotifyPageState=1");
    return Stack(
      children: [
        Expanded(
            flex: 1,
            child: Consumer(
              builder: (BuildContext context, NotifyProvider provider, child) {
                return ListView.builder(
                    itemCount: provider.netStr.length,
                    itemBuilder: (context, index) => Text(provider.netStr[index]));
              },
            )),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: 30,bottom: 30),
              child: FloatingActionButton(
                onPressed: () {
                   context.read<NotifyProvider>().getNetData();
                },
                child: const Text(
                  "新增R",
                  style: TextStyle(fontSize: 20, color: ColorPlate.red),
                ),
              ),
            )),
      ],
    );
  }
}




