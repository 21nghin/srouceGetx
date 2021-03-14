import 'package:aniuta/base/controller/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BaseView<T extends BaseController> extends StatelessWidget {
  const BaseView({Key key}) : super(key: key);

  final String tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (T controller) => getBuilder(),
    );
  }

  Widget getBuilder();
}
