import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //todo:第一步：通过MethodChannel声明一个通道，MethodChannel("params")的params是唯一的。
  static const platform =const MethodChannel("simples.flutter.io/battery");

  String _batteryLevel="unkonwn battery level";
  //todo:第二部：编写flutter方法，通过通道的invokeMethod<int>("method in android or ios")调用原生的方法。
  Future<Null> _getBatteryLevel()async{
    String batteryLevel;
    try{
      final int? result=await platform.invokeMethod<int>("getBatteryLevel");
      batteryLevel="battery level at ${result}";
    }on PlatformException catch(e){
      batteryLevel="failed to get battery level ${e.message}.";
    }
    setState(() {
      _batteryLevel=batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You phone battery level is:',
            ),
            Text(
              '$_batteryLevel',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getBatteryLevel,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
