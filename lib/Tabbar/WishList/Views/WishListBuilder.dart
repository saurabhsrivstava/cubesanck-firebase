import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/Home/Views/HomeProductCard.dart';
import 'package:cubesnack/Tabbar/WishList/Views/WebWishListCard.dart';
import 'package:cubesnack/Tabbar/WishList/Views/WishListCard.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/material.dart';

class WishListBuilder extends StatefulWidget {
  final List<Products> items;

  const WishListBuilder({Key key, this.items}) : super(key: key);

  @override
  _WishListBuilderState createState() => _WishListBuilderState();
}

class _WishListBuilderState extends State<WishListBuilder> {
  bool isList = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.list,
                    color: isList ? Colors.black : AppColors.grey500,
                  ),
                  onPressed: () {
                    this.setState(() {
                      isList = true;
                    });
                  }),
              IconButton(
                  icon: Icon(
                    Icons.grid_view,
                    color: !isList ? Colors.black : AppColors.grey500,
                  ),
                  onPressed: () {
                    this.setState(() {
                      isList = false;
                    });
                  })
            ],
          ),
          isList
              ? Expanded(
                  child: ListView.builder(
                  itemBuilder: (context, index) {
                    final item = this.widget.items[index];
                    return WishListCard(
                      item: item,
                    );
                  },
                  itemCount: widget.items.length,
                ))
              : Expanded(
                  child: GridView.builder(
                    padding: PlatformInfo.isDesktop(context)?EdgeInsets.only(left: size.height / 5, right: size.height / 5):EdgeInsets.all(0),
                    itemBuilder: (context, position) {
                      final item = this.widget.items[position];

                      return PlatformInfo.isDesktop(context)
                          ? WebWishListCard(
                              product: item,
                            )
                          : HomeProductCard(
                              product: item,
                            );
                    },
                    itemCount: widget.items?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: .75,
                      maxCrossAxisExtent: 300,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
