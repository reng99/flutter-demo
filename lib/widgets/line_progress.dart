import 'package:flutter/material.dart';

class LineProgress extends StatefulWidget {
  final title;
  const LineProgress({Key? key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LineProgressState();
  }
}

class _LineProgressState extends State<LineProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('hello'));
  }
}
