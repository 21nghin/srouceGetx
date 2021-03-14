import 'package:aniuta/utils/stream_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  AppBarView({
    this.leading,
    this.trailing,
    this.height,
    this.elevation,
    this.isTitle = false,
    this.title,
  });

  final Widget leading;
  final Widget trailing;
  final Widget title;
  final bool isTitle;
  final double height;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final StreamWidget stream = Get.find<StreamWidget>();

    final Widget _streamTitle = StreamBuilder<Widget>(
      stream: stream.outWidget,
      builder: (_, snapshot) => snapshot.hasData ? snapshot.data : Text('Home'),
    );

    return AppBar(
      elevation: elevation ?? 0,
      leading: leading ?? Container(),
      title: Center(
        child: isTitle ? _streamTitle : title,
      ),
      actions: _action,
    );
  }

  List<Widget> get _action => <Widget>[
        Container(
          child: trailing,
        )
      ];

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

}
