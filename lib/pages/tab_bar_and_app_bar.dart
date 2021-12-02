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
    return DefaultTabController(
      length: _choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            isScrollable: true,
            tabs: _choices
                .map((item) => Tab(
                      text: item.title,
                      icon: Icon(item.icon),
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: _choices
              .map((item) => Padding(
                    padding: EdgeInsets.all(16.0),
                    child: _ChoiceCard(tempChoice: item),
                  ))
              .toList(),
        ),
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

class _ChoiceCard extends StatelessWidget {
  final tempChoice;
  const _ChoiceCard({Key? key, this.tempChoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              tempChoice!.icon,
              size: 128.0,
              color: style!.color,
            ),
            Text(
              tempChoice!.title,
              style: style,
            )
          ],
        ),
      ),
    );
  }
}
