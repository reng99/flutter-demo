import 'package:flutter/material.dart';
import '../constants/dimension.dart';

class SelfProgressBarPage extends StatefulWidget {
  final title;
  const SelfProgressBarPage({Key? key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelfProgressBarPageState();
  }
}

class _SelfProgressBarPageState extends State<SelfProgressBarPage> {
  int? _progress;
  bool isProgressAvaliable(String nums) =>
      RegExp(r"(0|[1-9]|[1-9]\\d|100)").hasMatch(nums);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: Dimension.ELEVATION_TITLE,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              onSubmitted: (text) => setState(() =>
                  _progress = isProgressAvaliable(text) ? int.parse(text) : 0),
              decoration: InputDecoration(
                hintText: '请输入进度',
                errorText: "进度必须在0~100之间",
              ),
              keyboardType: TextInputType.number,
            ),
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          ),
          Container(
            height: 36,
            margin: EdgeInsets.all(20),
            child: Text('come on'),
          )
        ],
      ),
    );
  }
}
