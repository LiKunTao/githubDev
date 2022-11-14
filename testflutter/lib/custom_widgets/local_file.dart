import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/custom_widgets/base_widget.dart';
import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:testflutter/utils/toast_utils.dart';

class FlutterWidgetLocalFile extends BaseWidget {

  final String? filePath;


  const FlutterWidgetLocalFile({this.filePath});

  @override
  BaseWidgetState<BaseWidget> getState() {
    return FlutterWidgetLocalFileState();
  }
}

/**
 * /storage/emulated/0/Android/data/com.sumscope.qeubee.mobile/files/QBfile/qeubee午观察2022-07-07.pdf
 * /storage/emulated/0/Android/data/com.sumscope.qeubee.mobile/files/QBfile/移动端查看报告需求规格说明书_V2.2 (2).docx
 * /storage/emulated/0/Android/data/com.sumscope.qeubee.mobile/files/QBfile/11111.ppt
 * /storage/emulated/0/Android/data/com.sumscope.qeubee.mobile/files/QBfile/11232.xlsx
 *
 */
class FlutterWidgetLocalFileState extends BaseWidgetState<FlutterWidgetLocalFile> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    var path=ModalRoute.of(context)?.settings.arguments;
    toast("${path}");
    return Scaffold(
      appBar: CustomAppBar(title: "文件预览",),
      body: FileReaderView(filePath:"path",),
    );
  }
}
