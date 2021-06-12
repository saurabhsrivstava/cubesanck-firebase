import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MProductDetail.dart';
import 'package:cubesnack/Screens/Listing/AddListing/ProductDetails/Views/ProductDetailBuilder.dart';
import 'package:cubesnack/Screens/Listing/AddListing/SellerAddListingPage.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  AddListingBloc bloc;
  MProductDetail product;
  MCategoryResponse categories;
  @override
  void initState() {
    product = MProductDetail.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = SellerAddListingParent.of(context).bloc;
    MCategoryResponse categories;
    return BlocConsumer(
      builder: (context, state) {
        if (state is CategoryDoneState) {
          categories = state.categories;
        }
        return Stack(
          children: [
            ProductDetailBuilder(
              product: product,
              callBack: this._continue,
              categories: categories,
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is ErrorAddListingState) {
          AppAlert.showAlert(
              context: context, title: "error", message: state.errorMessage);
        }
        if (state is ListingDoneState) {
          //Setting Data for next screen
          UserSession.shared.productId = state.productId;
          SellerAddListingParent.of(context).data.productId = state.productId;
          SellerAddListingParent.of(context).data.categoryId = product.category;
          SellerAddListingParent.of(context)
              .data
              .stepCallBack(SellerAddListingSteps.priceVariation);
        }
      },
      cubit: bloc..add(LoadCategoryEvent()),
    );
  }

  _continue(context) {
    final error = product.validate();
    if (error == null) {
      bloc.add(CreateProductEvent(product: product));
    } else {
      AppAlert.showAlert(context: context, message: error, title: "Error");
    }

    // SellerAddListingParent.of(context).data.productId =
    //     "a7f8b86b-e99c-4d5e-93a4-8e5afad3fe69";
    // SellerAddListingParent.of(context).data.categoryId =
    //     "8ad44985-6794-40cf-9655-f99b43d8e15a";
    // SellerAddListingParent.of(context)
    //     .data
    //     .stepCallBack(SellerAddListingSteps.priceVariation);
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
