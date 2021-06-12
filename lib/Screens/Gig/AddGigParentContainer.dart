import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:flutter/material.dart';

class AddGigParentContainer extends InheritedWidget {
  const AddGigParentContainer({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(data != null),
        assert(child != null),
        super(key: key, child: child);

  final SignupData data;
  //final SellerSignupBloc bloc;

  static AddGigParentContainer of(BuildContext context) {
    // ignore: deprecated_member_use
    return context.dependOnInheritedWidgetOfExactType<AddGigParentContainer>();
  }

  @override
  bool updateShouldNotify(AddGigParentContainer old) {
    return false; //data != old.data;
  }
}
