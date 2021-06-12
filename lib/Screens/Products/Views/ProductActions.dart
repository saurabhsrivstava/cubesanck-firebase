import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppStepper.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/Tabbar/Home/Bloc/index.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class ProductActions extends StatefulWidget {
  final Products product;
  final Variants selected;
  const ProductActions({Key key, this.product, this.selected})
      : super(key: key);

  @override
  _ProductActionsState createState() => _ProductActionsState();
}

class _ProductActionsState extends State<ProductActions> {
  MAddCartResponse cartResponse;
  Products product;
  MCart cart;

  @override
  void initState() {
    cartResponse = MAddCartResponse.intit();
    cart = MCart(productId: widget.product.id, variantId: widget.selected?.id);
    product = widget.product;
    cart.quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppTitle(title: "Quantity"),
              Spacer(),
              AppStepper(
                valueCallBack: (v) {
                  cart.quantity = v;
                },
                value: cart.quantity,
              ),
            ],
          ),
          Container(
            child: AppTitle(
              title: widget.selected != null
                  ? "${widget.selected.availableQuantity} items left"
                  : "${widget.product.unitsInStock} items left",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppRoundButton(
                  width: 160,
                  title: "addToCart",
                  isRightIcon: false,
                  backgroundColor: Colors.white,
                  borderColor: AppColors.darkBlue,
                  titleColor: AppColors.darkBlue,
                  isBorder: true,
                  onPressed: () => this._addToCart(context),
                ),
                AppRoundButton(
                  width: 160,
                  title: "buyNow",
                  isRightIcon: false,
                  onPressed: () => _buyNow(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _addToCart(context) {
    if (!UserSession.shared.isLoggedIn()) {
      Navigator.pushNamed(context, AppRoutes.login);
      return;
    }
    if (cart.quantity == null) {
      AppAlert.showAlert(
          context: context,
          title: "error",
          message: "Quantity should be more than 1");
      return;
    }
    Toast.show("Adding to cart", context);
    cartResponse.items.clear();
    cartResponse.items.add(cart);
    final bloc = BlocProvider.of<HomeBloc>(context);
    bloc.add(AddToCartEvent(body: cartResponse.toJson(), product: product));
    appPrint(bloc);
  }

  _buyNow() {
    _addToCart(context);
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushNamed(context, AppRoutes.cart);
    });

    // return showModalBottomSheet(
    //     context: context,
    //     builder: (context) {
    //       return DeliveryAddressPage(
    //         isNavBar: false,
    //         mode: PageMode.select,
    //         addressCallBack: (v) {
    //           print(v);
    //         },
    //       );
    //     });
  }
}
