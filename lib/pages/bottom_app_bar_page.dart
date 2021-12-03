import 'package:flutter/material.dart';
import '../constants/dimension.dart';
import '../utils/toast.dart';

class BottomAppBarPage extends StatefulWidget {
  final title;
  const BottomAppBarPage({Key? key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomAppBarPageState();
  }
}

class _BottomAppBarPageState extends State<BottomAppBarPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _choices.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final newIndex = _tabController!.index + delta;
    if (newIndex < 0 || newIndex >= _tabController!.length) return;
    _tabController!.animateTo(newIndex);
    ToastUtil.showToast('The index is $newIndex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: Dimension.ELEVATION_TITLE,
        // leading: IconButton(
        //   tooltip: 'Previous choice',
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () => _nextPage(-1),
        // ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _nextPage(1),
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme:
                    ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: TabPageSelector(
                controller: _tabController,
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _choices
            .map((cho) => Padding(
                  padding: EdgeInsets.all(16.0),
                  child: _ChoiceCard(tempChoice: cho),
                ))
            .toList(),
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
