import 'package:aniuta/src/main_app/main_app_binding.dart';
import 'package:aniuta/src/main_app/main_app_view.dart';
import 'package:aniuta/src/new_test/news/news_binding.dart';
import 'package:aniuta/src/new_test/news/news_view.dart';
import 'package:aniuta/src/splash/binding.dart';
import 'package:aniuta/src/splash/splash.dart';
import 'package:aniuta/utils/routes/routes.dart';
import 'package:get/get.dart';

class Pages {
  static List<GetPage> pages() => [
        GetPage(
          name: Routes.SPLASH,
          page: () => Splash(),
          binding: SplashBinding(),
          children: <GetPage>[
            GetPage(
                name: Routes.MAIN_APP,
                page: () => MainAppView(),
                binding: HomeAppBinding(),
                children: <GetPage>[
                  GetPage(
                    name: Routes.NEW_TEST,
                    page: () => NewsView(),
                    binding: NewsBinding(),
                  ),
                ])
          ],
        ),
      ];
}
