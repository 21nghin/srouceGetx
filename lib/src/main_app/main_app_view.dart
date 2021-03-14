import 'package:aniuta/base/view/base_view.dart';
import 'package:aniuta/src/global_widget/app_bar_view.dart';
import 'package:aniuta/src/main_app/main_app_controller.dart';
import 'package:aniuta/src/main_app/widget_local/button_navigation.dart';
import 'package:aniuta/utils/sizes.dart';
import 'package:flutter/material.dart';

class MainAppView extends BaseView<MainAppController> {
  @override
  Widget getBuilder() {
    return Scaffold(
      appBar: AppBarView(
        isTitle: true,
        trailing: IconButton(icon: Icon(Icons.notification_important), onPressed: (){}, splashRadius: 28,),
      ),

      body: PageView(
        allowImplicitScrolling: true,
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: controller.listPage,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: Sizes.MARGIN_HORIZONTAL_18),
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ButtonNavigation(
                icon: Icon(Icons.home),
                onTab: () {
                  controller.streamWidget.inpWidget.add(const Text('Home'));
                  controller.onTabPage(0);
                },
              ),
              ButtonNavigation(
                icon: Icon(Icons.music_note_rounded),
                onTab: () {
                  controller.streamWidget.inpWidget.add(const Text('Tab 1'));
                  controller.onTabPage(1);
                },
              ),
              ButtonNavigation(
                icon: Icon(Icons.search_sharp),
                onTab: () {
                  controller.streamWidget.inpWidget.add(const Text('Tab 2'));
                  controller.onTabPage(2);
                },
              ),
              ButtonNavigation(
                icon: Icon(Icons.notification_important_rounded),
                onTab: () {
                  controller.streamWidget.inpWidget.add(const Text('Tab 3'));
                  controller.onTabPage(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
