import 'package:aniuta/base/view/base_view.dart';
import 'package:flutter/material.dart';

import 'splash_controller.dart';

class Splash extends BaseView<SplashController> {
  @override
  Widget getBuilder() {
    return Material(
      child: Center(
        child: Text(
          'Aniuta App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}
