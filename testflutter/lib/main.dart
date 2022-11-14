import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:testflutter/constants/unit_router.dart';
import 'package:testflutter/custom_widgets/home_sticky_page.dart';
import 'package:testflutter/custom_widgets/home_technology_page.dart';
import 'package:testflutter/custom_widgets/home_titlebar_page.dart';
import 'package:testflutter/custom_widgets/home_weather_page.dart';
import 'package:testflutter/utils/color_constants.dart';

import 'items/home_one_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      locale: const Locale('zh'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: UnitRouter.routerList,
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  static const List<Tab> _homeTopTabList = <Tab>[
    Tab(text: 'home', icon: Icon(Icons.music_note),),
    Tab(text: 'music', icon: Icon(Icons.directions_run)),
    Tab(text: 'weather', icon: Icon(Icons.cloud_queue)),
    Tab(text: 'tec', icon: Icon(Icons.toys))
  ];

  /**
   * 是否需要刷新状态，isRefreshState改为true，
   * 使用TabBarView显示界面；
   * 如果不需要isRefreshState改为false,
   * 使用IndexedStack显示界面；
   * 此时通过_tabController!.addListener的回调
   * 刷新数据。
   */
  var isRefreshState = true;

  TabController? _tabController;
  var _currentTopTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // TabController的滚动事件会触发一次监听, 点击事件会触发两次监听(一次是正常触发,一次是tab的动画触发)
    _tabController = TabController(length: _homeTopTabList.length, vsync: this);
    _tabController!.addListener(() {
      if (_currentTopTabIndex != _tabController!.index) {
        setState(() {
          _currentTopTabIndex = _tabController!.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isRefreshState
          ? TabBarView(
              controller: _tabController,
              children: [
                HomeStickyPage(),
                HomeAppBarPage(),
                HomeWeatherPage(),
                HomeTechnologyPage(),
              ],
            )
          : IndexedStack(
              index: _currentTopTabIndex,
              children: [
                HomeStickyPage(),
                HomeAppBarPage(),
                HomeWeatherPage(),
                HomeTechnologyPage(),
              ],
            ),
      bottomNavigationBar: TabBar(
        // isScrollable: true,
        labelColor: ColorPlate.yellow_ll,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: ColorPlate.blue_clear,
        indicatorWeight: 0.01,
        indicatorColor: ColorPlate.yellow_ll,
        tabs: _homeTopTabList,
        labelStyle: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        controller: _tabController,
      ),
    );
  }
}
