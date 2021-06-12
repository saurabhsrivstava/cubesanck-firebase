import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ViewEditStore/Pages/SellerViewEditStorePages.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ManageStoreCell extends StatelessWidget {
  final MStore store;
  const ManageStoreCell({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: store.displayName ?? "",
            fontSize: AppFont.title5,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                AppTitle(
                  title: "Delivery",
                  fontSize: AppFont.title3,
                ),
                AppTitle(
                  title: " Not Available",
                  fontSize: AppFont.title1,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppTitle(
                    title: "Pickup",
                    fontSize: AppFont.title3,
                  ),
                  AppTitle(
                    title: " Available",
                    fontSize: AppFont.title1,
                  ),
                ],
              ),
              Row(
                children: [
                  AppTitle(
                    title: "Shipping",
                    fontSize: AppFont.title3,
                  ),
                  AppTitle(
                    title: " Not Available",
                    fontSize: AppFont.title1,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // AppRoundButton(
              //   title: "editStore",
              //   height: 25,
              //   backgroundColor: Colors.white,
              //   fontSize: 8,
              //   isBorder: true,
              //   borderColor: AppColors.greyBorder,
              //   isRightIcon: false,
              //   width: 95,
              //   margin: 5,
              //   titleColor: Colors.black,
              //   onPressed: () => this._editStore(context),
              // ),
              AppRoundButton(
                title: "viewStore",
                height: 25,
                backgroundColor: Colors.white,
                fontSize: 8,
                isBorder: true,
                borderColor: AppColors.greyBorder,
                isRightIcon: false,
                width: 95,
                margin: 5,
                titleColor: Colors.black,
                onPressed: () => this._viewStore(context),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  _editStore(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SellerViewEditStorePages(
                  id: store.id,
                )));
  }

  _viewStore(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SellerViewEditStorePages(
                  id: store.id,
                )));
  }
}
