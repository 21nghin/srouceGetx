import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({Key key, this.onTab, this.icon}) : super(key: key);
  final Function() onTab;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: icon,
        onPressed: onTab,
      ),
    );
  }
}


