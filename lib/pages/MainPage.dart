import 'package:flutter/material.dart';

import '../constants/Strings.dart';
import '../constants/Dimens.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.home),
        centerTitle: true,
        elevation: Dimens.ELEVATION_TITLE,
      ),
      body: Container(
        child: Text('this is the demo'),
      ),
    );
  }
}
