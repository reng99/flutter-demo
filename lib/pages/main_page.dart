import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/dimension.dart';

import '../bean/route_bean.dart';

import 'basic_app_bar.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _pageNames = [
    'Basic AppBar',
  ];
  final _itemData = <RouteBean>[];

  void _initData(BuildContext context) {
    _itemData.clear();
    _itemData.add(RouteBean(
        _pageNames[0], (context) => BasicAppBar(title: _pageNames[0])));
  }

  @override
  Widget build(BuildContext context) {
    _initData(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.home),
        centerTitle: true,
        elevation: Dimension.ELEVATION_TITLE,
      ),
      body: Container(
        child: _buildNavigationList(context),
      ),
    );
  }

  Widget _buildNavigationList(_context) {
    return ListView.builder(
      itemCount: _itemData.length * 2,
      itemBuilder: (context, index) => index.isOdd
          ? const Divider(height: Dimension.DIVIDE_HEIGHT)
          : ListTile(
              title: Text(_itemData[index ~/ 2].toString()),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: _itemData[index ~/ 2].builder)),
            ),
    ).build(_context);
  }
}
