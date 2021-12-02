// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TabBarAndAppBar extends StatefulWidget {
  final title;
  const TabBarAndAppBar({Key? key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TabBarAndAppBarState();
  }
}

class TabBarAndAppBarState extends State<TabBarAndAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Text('jimmy'),
      ),
    );
  }
}

class _Choice {
  final title;
  final icon;
  const _Choice({this.title, this.icon});
}

const List<_Choice> _choices = <_Choice>[
  _Choice(title: 'Car', icon: Icons.directions_car),
  _Choice(title: 'Bicycle', icon: Icons.directions_bike),
  _Choice(title: 'Boat', icon: Icons.directions_boat),
  _Choice(title: 'Bus', icon: Icons.directions_bus),
  _Choice(title: 'Train', icon: Icons.directions_railway),
  _Choice(title: 'Walk', icon: Icons.directions_walk),
];
