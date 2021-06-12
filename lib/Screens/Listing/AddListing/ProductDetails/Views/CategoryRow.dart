import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MProductDetail.dart';
import 'package:cubesnack/Screens/Listing/AddListing/ProductDetails/Views/SubCategorySearch.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatefulWidget {
  final MCategoryResponse categories;
  final MProductDetail product;

  const CategoryRow({Key key, this.categories, this.product}) : super(key: key);

  @override
  _CategoryRowState createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  @override
  void initState() {
    this.widget.product.category =
        widget.categories.categories.first.category.id;
    seledtedCat = widget.categories.categories.first;
    super.initState();
  }

  MCategoryData seledtedCat;
  @override
  Widget build(BuildContext context) {
    final cat = widget.categories?.categories
        ?.toList()
        ?.map((e) => e.category.name)
        ?.toList();
    return Column(
      children: [
        AppDropdown(
          title: "Choose category*",
          top: 15,
          data: cat,
          bottom: 10,
          hintText: "Choose category",
          valueCallBack: (v, index) {
            this.setState(() {
              seledtedCat = widget.categories.categories
                  .firstWhere((e) => e.category.name == v);
              this.widget.product.category = seledtedCat.category.id;
              UserSession.shared.category = seledtedCat.category.id;
              appPrint(seledtedCat);
            });
          },
        ),
        MultiTitle(
          title: AppTitle(
            title: "Sub categories",
            fontSize: AppFont.title2,
          ),
          subTitle: AppTitle(
            title: "(can choose to list multiple category)*",
            fontSize: AppFont.title1,
          ),
          bottom: 5,
        ),
        SubCategorySearch(
          seledtedCat: seledtedCat,
          selectedCategoryCallBack: (v) {
            this.widget.product.subCategory = v.toList();
          },
        ),
      ],
    );
  }
}
