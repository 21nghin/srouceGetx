import 'package:aniuta/base/controller/base_controller.dart';
import 'package:aniuta/provider_services/api_services.dart';
import 'package:get/get.dart';

class NewsController extends BaseController{
  NewsController({this.apiServices});
  final ApiServices apiServices;

  @override
  void onReady() {
    super.onReady();
    _getNews();
  }

  void _getNews() {
    apiServices.getNews().then((value) {
      change(null, status: RxStatus.loading());
      if(value.hasError)change(null, status: RxStatus.error(value.statusText));
      if(value.status.connectionError)change(null, status: RxStatus.error(value.statusText));
      if(value.status.isOk)change(value.body, status: RxStatus.success());
    });
  }

}