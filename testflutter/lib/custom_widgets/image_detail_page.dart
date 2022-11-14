import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageDetailPage extends StatefulWidget {
  List<String> galleryItems = [
    "https://img1.baidu.com/it/u=205816793,1017407767&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fb%2F57bc0475f309b.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1670051402&t=efafd9eb1e9ab8dc1778aeb1915c1b58",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2Fe0%2F60%2Fd8%2Fe060d8b4a31a16f0be8f0dffdaab1499.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1670051417&t=cea7f87e0ece4198c2e8f243fa76ddf9"];

  ImageDetailPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImageDetailState();
  }
}

class ImageDetailState extends State<ImageDetailPage> {

  PageController? pageController;
  @override
  void initState() {
    super.initState();
    pageController=PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
                widget.galleryItems[index]),
            initialScale: PhotoViewComputedScale.contained * 1.0,
            heroAttributes:
                PhotoViewHeroAttributes(tag: widget.galleryItems[index]),
          );
        },
        itemCount: widget.galleryItems.length,
        pageController: pageController,
        onPageChanged: onPageChanged,
      ),
    );
  }

   onPageChanged(int a){

  }
}
