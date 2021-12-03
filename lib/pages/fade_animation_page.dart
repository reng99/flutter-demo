import 'package:flutter/material.dart';
import '../constants/dimension.dart';

class FadeAnimationPage extends StatefulWidget {
  final title;
  const FadeAnimationPage({Key? key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FadeAnimationPageState();
  }
}

class _FadeAnimationPageState extends State<FadeAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;
  bool isShowing = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: Dimension.ELEVATION_TITLE,
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: const FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Fade",
        child: const Icon(Icons.brush),
        onPressed: () {
          isShowing ? controller.reverse() : controller.forward();
          setState(() => isShowing = !isShowing);
        },
      ),
    );
  }
}
