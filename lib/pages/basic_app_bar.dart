// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BasicAppBar extends StatefulWidget {
  final title;
  const BasicAppBar({Key? key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BasicAppBarState();
  }
}

class BasicAppBarState extends State<BasicAppBar> {
  _Choice _selectedChoice = _choices[0];

  _select(choice) => setState(() => _selectedChoice = choice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(_choices[0].icon),
            onPressed: () => _select(_choices[0]),
          ),
          IconButton(
            icon: Icon(_choices[1].icon),
            onPressed: () => _select(_choices[1]),
          ),
          PopupMenuButton<_Choice>(
            onSelected: _select,
            itemBuilder: (context) => _choices
                .skip(2)
                .map((temp) => PopupMenuItem<_Choice>(
                      value: temp,
                      child: Text(temp.title),
                    ))
                .toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _ChoiceCard(tempChoice: _selectedChoice),
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
