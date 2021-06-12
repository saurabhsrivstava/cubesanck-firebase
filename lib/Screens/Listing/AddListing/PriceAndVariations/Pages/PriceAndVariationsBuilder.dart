import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Models/MProductDetailVariant.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Models/MVariationResponse.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Views/ColorVariationOptions.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class PriceAndVariationsBuilder extends StatelessWidget {
  final MVariationResponse response;
  final List<MColorVariation> dataControllers;
  final TextEditingController sellingPriceCnt;
  final TextEditingController discountPriceCnt;
  final TextEditingController maxOrderQuantityCnt;
  final Function continuePress;
  final MProductDetailVariant variant;
  PriceAndVariationsBuilder(
      {Key key,
      this.response,
      this.dataControllers,
      this.continuePress,
      this.sellingPriceCnt,
      this.discountPriceCnt,
      this.maxOrderQuantityCnt,
      this.variant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          _PriceRow(
            sellingPriceCnt: sellingPriceCnt,
            discountPriceCnt: discountPriceCnt,
          ),
          SizedBox(height: 15),
          _QuantityRow(
            maxOrderQuantityCnt: maxOrderQuantityCnt,
          ),
          AppGroupCheckbox(
            data: ["New", "Used", "Refurbised"],
            title: "Condition*",
            valueCallBack: (v, i) {
              this.variant.condition = v;
            },
          ),
          AppTextView(
            top: 15,
            title: "Additional conditional details",
            onChange: (v) {
              this.variant.additionalConditionalDetails = v;
            },
          ),
          if (response != null)
            ColorVariationOptions(
              variants: response.variants,
              controllers: dataControllers,
            ),
          AppRoundButton(
              margin: 30,
              width: 180,
              title: "continue",
              onPressed: () => this.continuePress(context))
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final TextEditingController sellingPriceCnt;
  final TextEditingController discountPriceCnt;
  const _PriceRow({Key key, this.sellingPriceCnt, this.discountPriceCnt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTitleTextField(
            title: "Your selling price*",
            controller: this.sellingPriceCnt,
            keyBoardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: AppTitleTextField(
            title: "Discounted price",
            controller: this.discountPriceCnt,
            keyBoardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}

class _QuantityRow extends StatelessWidget {
  final TextEditingController maxOrderQuantityCnt;

  const _QuantityRow({Key key, this.maxOrderQuantityCnt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                title: "Max order Quantity",
                fontSize: AppFont.title2,
                fontWeight: AppFont.bold,
              ),
              AppTitle(
                textAlign: TextAlign.start,
                maxLines: 4,
                title:
                    "We suggest limitting maximum order quantity, Not doing so may result in customer  buying your enntire inventory for this pproduct at the  discounted pricee",
                fontSize: AppFont.title0,
                fontWeight: AppFont.thin,
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: AppTextField(
            controller: maxOrderQuantityCnt,
            keyBoardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
