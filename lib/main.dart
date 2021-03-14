import 'package:aniuta/utils/routes/pages.dart';
import 'package:aniuta/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'QuicksandMedium'),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      getPages: Pages.pages(),
    );
  }
}



