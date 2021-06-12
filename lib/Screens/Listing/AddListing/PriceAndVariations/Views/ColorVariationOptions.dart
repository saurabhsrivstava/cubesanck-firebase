import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Models/MVariationResponse.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Views/BlankColorVariation.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:cubesnack/Utils/VariantGenerator.dart';
import 'package:flutter/material.dart';
import 'ColorVariationButton.dart';

class ColorVariationOptions extends StatefulWidget {
  final List<MVariants> variants;
  final List<MColorVariation> controllers;

  const ColorVariationOptions({Key key, this.variants, this.controllers})
      : super(key: key);

  @override
  _ColorVariationOptionsState createState() => _ColorVariationOptionsState();
}

class _ColorVariationOptionsState extends State<ColorVariationOptions> {
  List<dynamic> allOptions;
  Map<String, dynamic> allSelectedOptions;
  List<dynamic> allPossibleCombinations;
  int index = -1;
  @override
  void initState() {
    allOptions = List<dynamic>();
    allPossibleCombinations = List<dynamic>();

    allSelectedOptions = Map<String, dynamic>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.greyBorder)),
      child: Column(
        children: [
          ColorVariationSearchList(
            variants: this.widget.variants,
            selectedVariationCallBack: (v) {
              this.setState(() {
                allOptions = v;
              });
            },
          ),
          if (allOptions.length > 0) ..._generateAllOptions(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppRoundButton(
                margin: 20,
                title: "save",
                titleColor: AppColors.darkBlue,
                backgroundColor: Colors.white,
                isBorder: true,
                borderColor: AppColors.greyBorder,
                height: 30,
                width: 90,
                fontSize: 14,
                isRightIcon: false,
                onPressed: () => this._showAllCombinations(),
              ),
            ],
          ),
          if (allPossibleCombinations.length > 0) ..._createCombinations(),
        ],
      ),
    );
  }

  _createCombinations() {
    List<Widget> widgets = List<Widget>();
    // this.widget.controllers.clear();
    allPossibleCombinations.asMap().forEach((index, e) => {
          if (index > this.widget.controllers.length - 1)
            {
              this.widget.controllers.add(MColorVariation(data: e)),
            },
          widgets.add(BlankColorVariation(
            data: e,
            contrrollers: this.widget.controllers[index],
          ))
        });

    return widgets.toList();
  }

  _showAllCombinations() {
    List<dynamic> combinations = List<dynamic>();
    for (var comb in allSelectedOptions.values) {
      combinations.add(comb);
    }
    final a = VariantGenerator();
    this.setState(() {
      allPossibleCombinations = a.combineAll(combinations);
      appPrint(allPossibleCombinations);
    });
  }

  _generateAllOptions() {
    return this
        .allOptions
        .map((e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VariationOptionSearchList(
                  selectedVariationCallBack: (v, index) {
                    allSelectedOptions["$index"] = v;

                    appPrint("$allSelectedOptions inddex:$index");
                  },
                  variants: e.options,
                  displayTitle: e.type.name,
                  index: e.type.id,
                )
              ],
            ))
        .toList();
  }
}

class MColorVariation {
  final TextEditingController regPrice = TextEditingController();
  final TextEditingController sellPrice = TextEditingController();
  final TextEditingController sku = TextEditingController();
  final TextEditingController maxbrderQuantity = TextEditingController();
  final TextEditingController availableQuantity = TextEditingController();
  String image;
  dynamic data;
  MColorVariation({this.data, this.image});
}
