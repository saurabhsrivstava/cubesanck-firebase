import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Models/MProductDetailVariant.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Models/MVariationResponse.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Pages/PriceAndVariationsBuilder.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Views/ColorVariationOptions.dart';
import 'package:cubesnack/Screens/Listing/AddListing/SellerAddListingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceAndVariationsPage extends StatefulWidget {
  const PriceAndVariationsPage({Key key}) : super(key: key);

  @override
  _PriceAndVariationsPageState createState() => _PriceAndVariationsPageState();
}

class _PriceAndVariationsPageState extends State<PriceAndVariationsPage> {
  AddListingBloc bloc;
  final List<MColorVariation> dataControllers = List<MColorVariation>();
  final sellingPriceCnt = TextEditingController();
  final discountPriceCnt = TextEditingController();
  final maxOrderQuantityCnt = TextEditingController();
  final variant = MProductDetailVariant.init();

  @override
  void initState() {
    super.initState();
    bloc = AddListingBloc(ListingDefaultState());
  }

  @override
  Widget build(BuildContext context) {
    //SellerAddListingParent.of(context).bloc;
    final categoryId = SellerAddListingParent.of(context).data.categoryId;
    MVariationResponse response;
    return BlocConsumer(
      builder: (context, state) {
        if (state is VariationDoneState) {
          response = state.response;
        }

        return Stack(
          children: [
            PriceAndVariationsBuilder(
              response: response,
              dataControllers: dataControllers,
              continuePress: this._continuePressed,
              variant: variant,
              sellingPriceCnt: sellingPriceCnt,
              discountPriceCnt: discountPriceCnt,
              maxOrderQuantityCnt: maxOrderQuantityCnt,
            ),
            if (state is ListingLoadingState) AppLoader()
          ],
        );
      },
      listener: (context, state) {
        if (state is CreateProductVariantDoneState) {
          SellerAddListingParent.of(context)
              .data
              .stepCallBack(SellerAddListingSteps.shippingAndDelivery);
        }
        if (state is ErrorAddListingState) {
          AppAlert.showAlert(
              context: context, title: "Error", message: state.errorMessage);
        }
      },
      cubit: bloc..add(FetchVariationEvent(categoryId: categoryId)),
    );
  }

  _continuePressed(context) {
    // SellerAddListingParent.of(context)
    //     .data
    //     .stepCallBack(SellerAddListingSteps.shippingAndDelivery);
    final error = variant.validate();
    if (error == null) {
      final productId = SellerAddListingParent.of(context).data.productId;
      variant.variants.clear();
      variant.discountedPrice =
          discountPriceCnt.text.length > 0 ? discountPriceCnt.text.toInt() : 0;
      variant.sellingPrice =
          sellingPriceCnt.text.length > 0 ? sellingPriceCnt.text.toInt() : 0;
      variant.maxOrderQuantity = maxOrderQuantityCnt.text.length > 0
          ? maxOrderQuantityCnt.text.toInt()
          : 0;

      this.dataControllers.forEach((element) {
        if (element.maxbrderQuantity.text.length < 0) {
          return;
        }
        final variation = element.data
            .map((obj) =>
                MVariantOption(option: obj["value"], type: obj["type"]))
            .toList()
            .cast<MVariantOption>()
            .toList();
        final props = MProps(
            regularPrice: element.regPrice.text.length > 0
                ? element.regPrice.text.toInt()
                : 0,
            salePrice: element.sellPrice.text.isEmpty
                ? 0
                : element.sellPrice.text.toInt(),
            sku: element.sku.text,
            maxOrderQuantity: element.maxbrderQuantity.text.toInt(),
            availableQuantity: element.availableQuantity.text.toInt(),
            variantOption: variation,
            image: element.image);
        variant.variants.add(props);
      });
      bloc.add(AddVariationEvent(variant: variant, productId: productId));
    } else {
      AppAlert.showAlert(context: context, title: "error", message: error);
    }
  }

  @override
  void dispose() {
    bloc.close();
    this.dataControllers.forEach((MColorVariation e) => {
          e.availableQuantity.dispose(),
          e.regPrice.dispose(),
          e.sellPrice.dispose(),
          e.sku.dispose(),
          e.maxbrderQuantity.dispose()
        });
    super.dispose();
  }
}
