import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ManageStore/Views/ManageStoreCell.dart';
import 'package:flutter/material.dart';

class ManageStoreBuilder extends StatelessWidget {
  final List<MStore> stores;

  const ManageStoreBuilder({Key key, this.stores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ManageStoreCell(
            store: stores[index],
          );
        },
        itemCount: stores?.length ?? 0,
      ),
    );
  }
}
