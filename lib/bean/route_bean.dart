import 'package:flutter/material.dart';

class RouteBean {
  String name;
  WidgetBuilder builder;
  RouteBean(this.name, this.builder);
  @override
  toString() => name;
}
