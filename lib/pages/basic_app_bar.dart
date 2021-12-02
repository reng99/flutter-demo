// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BasicAppBar extends StatefulWidget {
  BasicAppBar({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  createState() => BasicAppBarState();
}

class BasicAppBarState extends State<BasicAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
