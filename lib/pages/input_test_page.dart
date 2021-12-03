import 'package:flutter/material.dart';
import '../constants/dimension.dart';

class InputTestPage extends StatelessWidget {
  final title;
  const InputTestPage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: Dimension.ELEVATION_TITLE,
      ),
      body: Container(
        child: _ChildWidget(),
      ),
    );
  }
}

class _ChildWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChildWidgetState();
  }
}

class _ChildWidgetState extends State<_ChildWidget> {
  late String _errorText;

  @override
  void initState() {
    super.initState();
    _errorText = '';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        onSubmitted: (text) => setState(() {
          if (isEmail(text)) {
            _errorText = '';
          } else {
            _errorText = 'Error: this is not an email';
          }
        }),
        decoration: InputDecoration(
            hintText: 'This is hint', errorText: _getErrorText()),
      ),
    );
  }

  _getErrorText() => _errorText;

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailRegexp);
    return regExp.hasMatch(em);
  }
}
