import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:flutter/material.dart';

class AllStoresGridView extends StatelessWidget {
  final List<MStore> stores;
  const AllStoresGridView({Key key, this.stores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemBuilder: (context, position) {
          final store = stores[position];
          return Column(
            children: [
              Expanded(
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    //height: 170,
                    width: 250,
                    child: CachedNetworkImage(
                      imageUrl: store.logo,
                      // fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.red,
                    ),
                  ),
                ),
              ),
              AppTitle(
                title: store.displayName,
                fontSize: 12,
              )
            ],
          );
        },
        itemCount: stores?.length ?? 0,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
