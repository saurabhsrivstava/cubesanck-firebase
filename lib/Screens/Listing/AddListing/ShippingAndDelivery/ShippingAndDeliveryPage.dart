import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MShipping.dart';
import 'package:cubesnack/Screens/Listing/AddListing/SellerAddListingPage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/ShippingAndDelivery/Views/ShippingAndDeliveryBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAndDeliveryPage extends StatefulWidget {
  const ShippingAndDeliveryPage({Key key}) : super(key: key);

  @override
  _ShippingAndDeliveryPageState createState() =>
      _ShippingAndDeliveryPageState();
}

class _ShippingAndDeliveryPageState extends State<ShippingAndDeliveryPage> {
  AddListingBloc bloc;
  MShipping shipping;

  @override
  void initState() {
    shipping = MShipping.init();
    bloc = AddListingBloc(ListingDefaultState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        return Stack(
          children: [
            ShippingAndDeliveryBuilder(
              shipping: shipping,
              continuePress: this._continuePress,
            ),
            if (state is ListingLoadingState) AppLoader()
          ],
        );
      },
      listener: (context, state) {
        if (state is ListingDoneState)
          SellerAddListingParent.of(context)
              .data
              .stepCallBack(SellerAddListingSteps.tAndC);
        if (state is ErrorAddListingState) {
          AppAlert.showAlert(
              context: context, message: "Error", title: state.errorMessage);
        }
      },
      cubit: bloc,
    );
  }

  _continuePress(context) {
    final productId = SellerAddListingParent.of(context).data.productId;
    bloc.add(AddShippingEvent(productId: productId, shipping: shipping));

    // SellerAddListingParent.of(context)
    //     .data
    //     .stepCallBack(SellerAddListingSteps.tAndC);
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
