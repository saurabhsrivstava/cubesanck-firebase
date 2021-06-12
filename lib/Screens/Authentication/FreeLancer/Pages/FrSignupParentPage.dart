import 'package:flutter/material.dart';

import '../../SellerSignup/SellerSignupPage.dart';

class FrSignupParentPage extends InheritedWidget {
  const FrSignupParentPage({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(data != null),
        assert(child != null),
        super(key: key, child: child);

  final SignupData data;
  //final SellerSignupBloc bloc;

  static FrSignupParentPage of(BuildContext context) {
    // ignore: deprecated_member_use
    return context.dependOnInheritedWidgetOfExactType<FrSignupParentPage>();
  }

  @override
  bool updateShouldNotify(FrSignupParentPage old) {
    return false; //data != old.data;
  }
}
