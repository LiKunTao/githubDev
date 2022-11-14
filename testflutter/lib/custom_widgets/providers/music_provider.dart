import 'package:audioplayers/audioplayers.dart';
import 'package:testflutter/custom_widgets/base_widget.dart';
import 'package:testflutter/custom_widgets/providers/base_provider.dart';

class MusicProvider<T extends BaseWidgetState> extends BaseProvider{
  final _musicList=[
    {"url":"https://live.idbhost.com/sv/bc968e4-1843712eb27/bc968e4-1843712eb27.m4a","art":"星主播"},
    {"url":"https://www.ytmp3.cn/down/78319.mp3","art":"//Go Time [HQ]_Mark Petrie"},
    {"url":"https://www.ytmp3.cn/down/78382.mp3","art":"//未知"},
    {"url":"https://www.ytmp3.cn/down/78326.mp3","art":"//Let Go (The Train Vrs. Edit)"},
    {"url":"https://www.ytmp3.cn/down/78314.mp3","art":"//敢问路在何方"},
    {"url":"https://www.ytmp3.cn/down/11143.mp3","art":"//葫芦丝"},
    {"url":"https://www.ytmp3.cn/down/52445.mp3","art":"//Give Me Some Sunshine"},
    {"url":"https://www.ytmp3.cn/down/78243.mp3","art":"//Levels - Avicii"},
    {"url":"https://www.ytmp3.cn/down/78318.mp3","art":"//You Make My Dreams"},
    {"url":"https://www.ytmp3.cn/down/78313.mp3","art":"//So Far Away"},
    {"url":"https://www.ytmp3.cn/down/78309.mp3","art":"//Watch Me Work_Tinashe"},
    {"url":"https://www.ytmp3.cn/down/78190.mp3","art":"//Clarity_Jonathan Lindner"},
    {"url":"https://www.ytmp3.cn/down/78161.mp3","art":"//Run Free"},
    {"url":"https://www.ytmp3.cn/down/78107.mp3","art":"//Children of the Dark"},
    {"url":"https://www.ytmp3.cn/down/78105.mp3","art":"//The Best of You"},
    {"url":"https://www.ytmp3.cn/down/77976.mp3","art":"//simple times_Kacey Musgraves"},
    {"url":"https://www.ytmp3.cn/down/77954.mp3","art":"//Head In The Clouds_Hayd"},
    {"url":"https://www.ytmp3.cn/down/77776.mp3","art":"//Stay Young_Mike Perry"},
    {"url":"https://www.ytmp3.cn/down/77744.mp3","art":"//tysm - normal no more"},
    {"url":"https://www.ytmp3.cn/down/77333.mp3","art":"//Cratered_Gordy Haab"},
    {"url":"https://www.ytmp3.cn/down/77285.mp3","art":"//Fatal Love_Jori King"},
    {"url":"https://www.ytmp3.cn/down/77273.mp3","art":"//Play_K-391"},
    {"url":"https://www.ytmp3.cn/down/77252.mp3","art":"//The Fairy - nunu"},
    {"url":"https://www.ytmp3.cn/down/77206.mp3","art":"//Sea Shanty Medley"},
    {"url":"https://www.ytmp3.cn/down/77056.mp3","art":"//Wind_Akeboshi"},
    {"url":"https://www.ytmp3.cn/down/76930.mp3","art":"//Faded - Alan Walker/Iselin Solheim"},
    {"url":"https://www.ytmp3.cn/down/76857.mp3","art":"//Shampoo (Japan Ver.) - After School"},
    {"url":"https://www.ytmp3.cn/down/76697.mp3","art":"//Your Eyes_Cook da books"},
    {"url":"https://www.ytmp3.cn/down/76217.mp3","art":"//summertime - cinnamons/evening cinema"},
    {"url":"https://www.ytmp3.cn/down/78384.mp3","art":"//恋愛サーキュレーション_花澤香菜"},
    {"url":"https://www.ytmp3.cn/down/10153.mp3","art":"//刀郎 - 谢谢你"},
  ];

  List<Map<String,String>> get musicList=>_musicList;

  String? getStr(int index){
    return _musicList[index]["art"];
  }

  AudioPlayer _audioPlayer=AudioPlayer()..setReleaseMode(ReleaseMode.stop);

  AudioPlayer get audioPlayer=>_audioPlayer;

  var _selectPosition=0;

  void setSelectPosition(int value) async{
    _selectPosition = value;
    if (_audioPlayer.state==PlayerState.playing) {
       _audioPlayer.stop();
    }
    // await _audioPlayer.play(UrlSource(_musicList[_selectPosition]["url"]!));
    notifyListeners();
  }

 int get selectPosition => _selectPosition;
}