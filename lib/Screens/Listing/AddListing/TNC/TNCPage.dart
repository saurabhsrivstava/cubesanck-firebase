import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MTAC.dart';
import 'package:cubesnack/Screens/Listing/AddListing/SellerAddListingPage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/TNC/Views/TANCBuilder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TNCPage extends StatefulWidget {
  const TNCPage({Key key}) : super(key: key);

  @override
  _TNCPageState createState() => _TNCPageState();
}

class _TNCPageState extends State<TNCPage> {
  AddListingBloc bloc;
  MTAC tAndC;

  @override
  void initState() {
    bloc = AddListingBloc(ListingDefaultState());
    tAndC = MTAC.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        return Stack(
          children: [
            TANCBuilder(continuePress: this._continuePress, tAndC: tAndC),
            if (state is ListingLoadingState) AppLoader()
          ],
        );
      },
      listener: (context, state) {
        if (state is ListingDoneState)
          SellerAddListingParent.of(context)
              .data
              .stepCallBack(SellerAddListingSteps.promoteListing);
        if (state is ErrorAddListingState) {
          AppAlert.showAlert(
              context: context, title: "Error", message: state.errorMessage);
        }
      },
      cubit: bloc,
    );
  }

  _continuePress(context) {
    final error = tAndC.validate();
    if (error == null) {
      final productId = SellerAddListingParent.of(context).data.productId;
      bloc.add(AddTandEvent(productId: productId, tandc: tAndC));
    } else {
      AppAlert.showAlert(context: context, title: "Error", message: error);
    }

    // SellerAddListingParent.of(context)
    //     .data
    //     .stepCallBack(SellerAddListingSteps.promoteListing);
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
