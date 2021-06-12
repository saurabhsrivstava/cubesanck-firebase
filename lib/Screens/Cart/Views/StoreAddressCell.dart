import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class StoreAddressCell extends StatelessWidget {
  final Store store;
  final Function valueCallBack;
  const StoreAddressCell({Key key, this.store, this.valueCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MPhysicalStore address = this.store.physicalStores.length > 0
        ? this.store.physicalStores.first
        : null;
    // if (address != null) {
    //   this.valueCallBack(address);
    // }
    return address == null
        ? AppTitle(title: "No Physical Store")
        : Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle(
                  title: address.name ?? "",
                  fontSize: AppFont.title3,
                  fontWeight: AppFont.bold,
                  padding: EdgeInsets.only(bottom: 7),
                ),
                AppTitle(
                  title: address.address.address1,
                  fontSize: AppFont.title2,
                  color: AppColors.grey600,
                ),
                AppTitle(
                  title:
                      "${address.address.address2} ${address.address.city} ${address.address.state} ${address.address.phone}",
                  fontSize: AppFont.title2,
                  color: AppColors.grey600,
                ),
              ],
            ),
          );
  }
}
