import 'package:aniuta/base/controller/base_controller.dart';
import 'package:aniuta/utils/stream_widget.dart';
import 'package:aniuta/utils/x_r.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppController extends BaseController {
  MainAppController({this.streamWidget});
  final StreamWidget streamWidget;

  PageController pageController;

  List<Widget> get listPage => <Widget>[
    Center(
      child: MaterialButton(color: Colors.orange, onPressed:goToFromTestNews, child: Text('Test 2')),
    ),
    Center(
      child: Text(XR().string.page2),
    ),
    Center(
      child: Text(XR().string.page3),
    ),
    Center(
      child: Text(XR().string.page4),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void goToFromTestPage(){
    Get.toNamed('/splash/main_app/test');
  }
  void goToFromTestNews(){
    Get.toNamed('/splash/main_app/news');
  }

  void onTabPage(int index){
    pageController.jumpToPage(index);
    update();
  }


  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    streamWidget.close();
  }
}



