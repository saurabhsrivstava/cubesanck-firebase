import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MPromoteListing.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PromoteListing/Views/PromoteListingBuilder.dart';
import 'package:cubesnack/Screens/Listing/AddListing/SellerAddListingPage.dart';
import 'package:cubesnack/Utils/TokenManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class PromoteListingPage extends StatefulWidget {
  final String id;
  const PromoteListingPage({Key key, this.id}) : super(key: key);

  @override
  _PromoteListingPageState createState() => _PromoteListingPageState();
}

class _PromoteListingPageState extends State<PromoteListingPage> {
  AddListingBloc bloc;
  MPromoteListing listing;
  @override
  void initState() {
    super.initState();
    listing = MPromoteListing(
        startDate: DateTime.now().toString(),
        endDate: DateTime.now().add(Duration(days: 1)).toString());
    bloc = AddListingBloc(ListingDefaultState());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        return Stack(
          children: [
            PromoteListingBuilder(
              continuePress: this._continuePress,
              listing: listing,
            ),
            if (state is ListingLoadingState) AppLoader()
          ],
        );
      },
      listener: (context, state) {
        if (state is ListingDoneState) {
          Toast.show("Product submitted for approval", context, duration: 2);
          TokenManager.resetLastProduct();
          //Navigator.of(context).popUntil(ModalRoute.withName("/"));
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
        if (state is ErrorAddListingState) {
          AppAlert.showAlert(
              context: context, title: "error", message: state.errorMessage);
        }
      },
      cubit: bloc,
    );
  }

  _continuePress(context) {
    final error = listing.validate();
    if (error == null) {
      if (this.widget.id != null) {
        bloc.add(AddPromoteEvent(listing: listing, productId: this.widget.id));
        return;
      }
      final productId = SellerAddListingParent.of(context).data.productId;
      bloc.add(AddPromoteEvent(listing: listing, productId: productId));
      //Produuct id can be passed from all liisting as well
    } else {
      AppAlert.showAlert(context: context, title: "error", message: error);
    }
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
