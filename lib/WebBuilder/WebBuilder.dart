import 'package:flutter/material.dart';

class WebBuilder extends StatelessWidget {
  final Widget child;
  const WebBuilder({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
              child: child,
              width: constraints.maxWidth > 500 ? 700 : size.width),
        );
      },
    );
  }
}
