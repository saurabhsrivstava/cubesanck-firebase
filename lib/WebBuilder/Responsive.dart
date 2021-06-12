import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Responsive extends StatelessWidget {
  final Widget child;
  Widget mobile;
  Widget tablet;
  Widget desktop;

  Responsive({
    Key key,
    @required this.child,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return Center(
        child: Container(
          child: child,
          width: double.infinity,
        ),
      );
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 850) {
      return child;
    }
    // Or less then that we called it mobile
    else {
      return child;
    }
  }
}
