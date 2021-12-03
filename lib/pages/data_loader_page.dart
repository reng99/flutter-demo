import 'package:flutter/material.dart';
import '../constants/dimension.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataLoaderPage extends StatelessWidget {
  final title;
  const DataLoaderPage({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: Dimension.ELEVATION_TITLE,
      ),
      body: _ChildWidget(),
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
  List widgets = [];

  @override
  void initState() {
    print('response');
    super.initState();
    loadData();
  }

  loadData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  showLoadingDialog() => widgets.length == 0;

  getBody() => showLoadingDialog() ? getProgressDialog() : getListView();

  getProgressDialog() => const Center(
        child: CircularProgressIndicator(),
      );

  ListView getListView() => ListView.builder(
        itemBuilder: (context, position) => getRow(position),
        itemCount: widgets.length,
      );

  getRow(i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Row ${widgets[i]['title']}'),
          ),
          const Divider(
            height: Dimension.DIVIDE_HEIGHT,
          ),
        ],
      );

  @override
  build(context) => getBody();
}
