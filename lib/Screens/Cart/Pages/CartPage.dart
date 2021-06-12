import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Cart/Models/FastShippingResponse.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartPrentContainer.dart';
import 'package:cubesnack/Screens/Cart/Views/CartView.dart';
import 'package:cubesnack/Screens/Products/Views/DeliveryOptions.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartBloc bloc;
  List<MCartItem> items;
  List<FastShipping> deliveryOptions;
  String id;
  @override
  void initState() {
    deliveryOptions = List<FastShipping>();
    bloc = CartBloc(CartDefaultState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "yourCart",
        ),
        body: BlocProvider(
          create: (context) => bloc,
          child: BlocConsumer(
            builder: (context, state) {
              if (state is CartDoneState || state is CartDeleteDoneState) {
                items = state.items;
                id = (state is CartDoneState) ? state.cartId : id;
                CartPrentContainer.of(context).data.items = state.items;
                CartPrentContainer.of(context).data.bloc.add(
                    UpdateCartPriceEvent(
                        items: CartPrentContainer.of(context).data.items));
              }
              return Stack(
                children: [
                  CartView(
                    items: items,
                    id: id,
                    deliveryOptions: deliveryOptions,
                  ),
                  if (state is CartLoadingState) AppLoader()
                ],
              );
            },
            listener: (context, state) {
              if (state is ErrorCartState) {
                AppAlert.showAlert(
                    context: context,
                    title: "Error",
                    message: state.errorMessage);
              }
              if (state is CartDeleteDoneState) {
                Toast.show("Deleted", context);
              }
              if (state is CartInvoiceCreatedState) {
                Navigator.pushNamed(context, AppRoutes.cardList,
                    arguments: state.order);
              }
            },
            cubit: bloc..add(LoadCartEvent()),
          ),
        ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
