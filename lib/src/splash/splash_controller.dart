import 'package:aniuta/base/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {

  @override
  void onReady() {
    super.onReady();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
      ),
    );

    Future.delayed(
      Duration(seconds: 2),
          () => Get.offNamed(
          '/splash/main_app',
          ),
    );
  }
}