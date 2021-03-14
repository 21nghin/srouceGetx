import 'package:get/get.dart';

class Handler{
  static final Handler _singleton = Handler._internal();

  factory Handler() => _singleton;

  Handler._internal();

  void noInternetSnackBar()=>Get.rawSnackbar(snackPosition: SnackPosition.BOTTOM,message: "Xin vui lòng kiểm tra kết nối Internet của bạn!",title: 'Không có Internet');
  void getInternetSnackBar()=>Get.rawSnackbar(snackPosition: SnackPosition.BOTTOM,message: "Kết nối Internet đã được khôi phục",title: 'Đã khôi phục Internet');
}