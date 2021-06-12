import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Messages",
      ),

      // child: child,
    );
  }
}
