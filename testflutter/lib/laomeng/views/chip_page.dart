import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/appBars/custom_appbar.dart';
import 'package:testflutter/utils/assets_image_utils.dart';
import 'package:testflutter/utils/color_constants.dart';
import 'package:testflutter/utils/toast_utils.dart';

class ChipPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChipPageState();
  }

  const ChipPage();
}

class _ChipPageState extends State<ChipPage> {
  bool isEnable = true;
  int selectedIndex = 0;
  List<String> _filters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleLeading: Container(child:Image.asset(ImagePath.icon_back)),
        onBack: (){
          Navigator.of(context).pop();
        },
        height: 60,
        titleBackgroundColor: ColorPlate.green,
        title: "ChipDemo",
        onTap: () => {toast("ChipDemo")},
      ),
      body: Column(
        children: [
          Row(
            children: [
              RawChip(
                labelPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isEnable ? ColorPlate.red : ColorPlate.yellow),
                avatar: Image.asset(
                  ImagePath.icon_qq,
                  width: 20,
                  height: 20,
                ),
                label: Text("${isEnable}"),
                isEnabled: isEnable,
              ),
              RawChip(
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isEnable ? ColorPlate.red : ColorPlate.black),
                label: Text("${isEnable}"),
                //不添加onDeleted，右边的图标不显示
                onDeleted: () => {toast("delete")},
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: ColorPlate.red,
                isEnabled: isEnable,
              ),
              RawChip(
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isEnable ? ColorPlate.red : ColorPlate.green),
                label: Text("${isEnable}"),
                //不添加onDeleted，右边的图标不显示
                onDeleted: () => {toast("shape")},
                deleteIcon: Icon(Icons.sort),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                deleteIconColor: ColorPlate.green,
                isEnabled: isEnable,
              ),
            ],
          ),
          Row(
            children: [
              RawChip(
                elevation: 10,
                shadowColor: ColorPlate.blue,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isEnable ? ColorPlate.red : ColorPlate.black),
                label: Text("${isEnable}"),
                //不添加onDeleted，右边的图标不显示
                onDeleted: () => {toast("elevation")},
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: ColorPlate.red,
                isEnabled: isEnable,
              ),
              RawChip(
                pressElevation: 10,
                shadowColor: ColorPlate.blue,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isEnable ? ColorPlate.red : ColorPlate.black),
                label: Text("${isEnable}"),
                selected: isEnable,
                onSelected: (v) {
                  setState(() {
                    isEnable = v;
                  });
                },
                showCheckmark: true,
                checkmarkColor: ColorPlate.red,
                deleteIconColor: ColorPlate.red,
              )
            ],
          ),
          Row(
            children: [
              InputChip(
                label: Text("inputchip"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              )
            ],
          ),
          Wrap(
            spacing: 20,
            children: List.generate(count, (index) {
              return ChoiceChip(
                disabledColor: ColorPlate.green,
                selectedColor: ColorPlate.red,
                backgroundColor: ColorPlate.yellow,
                selected: selectedIndex == index,
                onSelected: (v) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                label: Text("${count}"),
              );
            }).toList(),
          ),
          Column(
            children: <Widget>[
              Wrap(
                spacing: 1,
                children: List.generate(count, (index) {
                  return FilterChip(
                    avatar:_filters.contains("${index}")?Container(): Text("X"),
                    showCheckmark: true,
                    checkmarkColor: ColorPlate.yellow,
                    label: Text("第${index}"),
                    selected: _filters.contains("${index}"),
                    selectedColor: ColorPlate.red,
                    backgroundColor: ColorPlate.green,
                    onSelected: (v) {
                      setState(() {
                        if (v) {
                          _filters.add("${index}");
                        } else {
                          _filters
                              .removeWhere((element) => element == "${index}");
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              Text("选中${_filters.join(",")}")
            ],
          ),
          Row(children: [
            ActionChip(label: Text("actionChip"), onPressed: (){
              toast("点击Chip");
            })
          ],),
          Expanded(flex: 1, child: SizedBox()),
          FloatingActionButton(onPressed: _changeState)
        ],
      ),
    );
  }

  var count = 6;

  void _changeState() {
    setState(() {
      isEnable = !isEnable;
      count++;
    });
  }
}
