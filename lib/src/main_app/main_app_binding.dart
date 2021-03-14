import 'package:aniuta/src/main_app/main_app_controller.dart';
import 'package:aniuta/utils/stream_widget.dart';
import 'package:get/get.dart';

class HomeAppBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainAppController(streamWidget: Get.put(StreamWidget())));
  }
}