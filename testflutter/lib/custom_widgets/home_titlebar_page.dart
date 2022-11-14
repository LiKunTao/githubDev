import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tapped/tapped.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/custom_widgets/base_widget.dart';
import 'package:testflutter/custom_widgets/providers/music_provider.dart';
import 'package:testflutter/custom_widgets/test_provider_notify/notify_page.dart';
import 'package:testflutter/utils/assets_image_utils.dart';
import 'package:testflutter/utils/color_constants.dart';
import 'package:testflutter/utils/logutils.dart';
import 'package:testflutter/utils/toast_utils.dart';

class HomeAppBarPage extends BaseWidget {
  final String? titleStr;

  const HomeAppBarPage({Key? key, this.titleStr}) : super(key: key);

  @override
  BaseWidgetState<BaseWidget> getState() {
    return _HomeAppBarPageState();
  }

  @override
  State<StatefulWidget> createState() {
    return _HomeAppBarPageState();
  }

}

class _HomeAppBarPageState extends BaseWidgetState<HomeAppBarPage> {
  MusicProvider? _musicProvider;

  String second="--";
  String currentPositionStr="--";
  String duration="--";

  @override
  void initState() {
    super.initState();
    _musicProvider=MusicProvider<_HomeAppBarPageState>()..onNetListener=this;
    _musicProvider?.audioPlayer.onPlayerComplete.listen((event) {

    });
    _musicProvider?.audioPlayer.onSeekComplete.listen((event) {

    });
    _musicProvider?.audioPlayer.onPlayerStateChanged.listen((event) {
      print("onPlayerStateChanged=$event");
      if(event==PlayerState.playing){
        // _musicProvider?.onNetListener.onEnd();
      }
    });
    _musicProvider?.audioPlayer.onPositionChanged.listen((event) async {
      second = "${event.inSeconds}";

      ///总时长
      var totalLength = await _musicProvider?.audioPlayer.getDuration();
      duration = "${totalLength}";
      ///当前进度
      var currentPosition = await _musicProvider?.audioPlayer.getCurrentPosition();
      currentPositionStr = "${currentPosition}";
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) =>_musicProvider,
      child:Scaffold(
        appBar: CustomAppBar(
          titleLeading: const SizedBox(),
          titleBackgroundColor: ColorPlate.yellow_ll,
          title: "AppBar",
          height: 40,
          titleStyle: const TextStyle(color: ColorPlate.blue_clear,fontWeight: FontWeight.bold),
          localActions: Image.asset(ImagePath.icon_copylink),
          onTap: () {
            toast("onTap");
          },
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: ColorPlate.blue_clear,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: ColorPlate.yellow_ll,
                    ))
              ],
            ),
            ListView.builder(
                itemCount:  _musicProvider?.musicList.length,
                itemBuilder: (context, index) {
                  return  GestureDetector(
                    ///全条目可点击
                    behavior: HitTestBehavior.opaque,
                    onTap:(){
                      if (index==_musicProvider?.selectPosition) {
                        return;
                      }
                      _musicProvider?.setSelectPosition(index);
                      setState(() {
                        currentPositionStr="--";
                        duration="--";
                        // _musicProvider?.onNetListener.onStart();
                      });
                      // toast("msg");
                      // NotifyPage
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotifyPageWidget()));
                    } ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Container(
                          color:ColorPlate.red,
                          padding:const EdgeInsets.only(left: 12),
                          child: Text(_musicProvider?.getStr(index)??"**",style: const TextStyle(fontSize: 20,color: ColorPlate.white,fontWeight: FontWeight.bold),),
                        ),
                        const Divider(
                          color: ColorPlate.red,
                        )
                      ],
                    ),
                  );
                }),
            Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(shape: BoxShape.circle,color: ColorPlate.green,),
              // color: ColorPlate.red,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: Text("${currentPositionStr.split(".")[0]}*"+"${duration.split(".")[0]}")
            ),
          ],
        ),
      ));
  }

  @override
  void dispose() {
    _musicProvider?.audioPlayer.release();
    super.dispose();
  }
}

