import 'package:aniuta/provider_services/api_provider.dart';
import 'package:aniuta/src/new_test/news/news_contrller.dart';
import 'package:get/get.dart';

class NewsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.lazyPut<NewsController>(() => NewsController(apiServices: Get.find<ApiProvider>()));
  }

}