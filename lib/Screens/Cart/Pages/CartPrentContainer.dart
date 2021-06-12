import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:flutter/material.dart';

class CartPrentContainer extends InheritedWidget {
  const CartPrentContainer({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(data != null),
        assert(child != null),
        super(key: key, child: child);

  final CartParentData data;
  //final SellerSignupBloc bloc;

  static CartPrentContainer of(BuildContext context) {
    // ignore: deprecated_member_use
    return context.dependOnInheritedWidgetOfExactType<CartPrentContainer>();
  }

  @override
  bool updateShouldNotify(CartPrentContainer old) {
    return false; //data != old.data;
  }
}

class CartParentData {
  CartBloc bloc;
  List<MCartItem> items;
  CartParentData({this.bloc, this.items});
}
