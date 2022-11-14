import 'package:flutter/material.dart';
import 'package:testflutter/utils/assets_image_utils.dart';
import 'package:testflutter/utils/color_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String? title;
  Color titleBackgroundColor;
  TextStyle titleStyle;
  //点击回调
  final VoidCallback? onTap;
  final VoidCallback? onBack;
  final Widget? localActions;
  final Widget? titleLeading;

  /*LaomengBar({
    Key? key,
    this.titleBackgroundColor = ColorPlate.red,
    required this.height,
    required this.onTap,
    this.title,
    this.actions,
  }) : super(key: key);*/


  CustomAppBar({
    required this.title,
    this.onTap,
    this.onBack,
    this.titleLeading,
    this.localActions,
    this.height = 60,
    this.titleBackgroundColor = ColorPlate.red,
    this.titleStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:GestureDetector(
        child: titleLeading!=null?titleLeading:Container(child:Image.asset(ImagePath.icon_back)),
        onTap: onBack,
      ),
      elevation: 0,
      titleSpacing: 0,
      centerTitle: true,
      title: Text(title!,style: this.titleStyle),
      backgroundColor: titleBackgroundColor,
      actions: [
        GestureDetector(
          child: localActions!=null?localActions:SizedBox(),
          onTap: onTap,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
