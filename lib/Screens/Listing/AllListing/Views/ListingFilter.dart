import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Filters/Category/View/CategoryFilterDropdown.dart';
import 'package:cubesnack/Screens/Filters/Store/StoreFilterDropdown.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ListingFilter extends StatelessWidget {
  final Function filterCallBack;
  final Function refrreshPress;
  const ListingFilter({Key key, this.filterCallBack, this.refrreshPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppTitle(
              title: "Product Listing Filter by",
              fontSize: AppFont.title2,
              fontWeight: AppFont.bold,
              padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
            ),
            Spacer(),
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () => this.refrreshPress())
          ],
        ),
        Container(
          height: 60,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryFilterDropdown(
                  filterCallBack: (v, FilterType type) =>
                      filterCallBack(v, type),
                ),
                StoreFilterDropdown(
                  filterCallBack: (v, FilterType type) =>
                      filterCallBack(v, type),
                ),
                Container(
                  width: 110,
                  child: AppDropdown(
                    data: ["Active", "Inactive"],
                    height: 30,
                    fontSize: 10,
                    title: 'Status',
                    valueCallBack: (v, index) {
                      filterCallBack(
                          v == "Active" ? true : false, FilterType.status);
                    },
                  ),
                  margin: EdgeInsets.only(right: 10),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
