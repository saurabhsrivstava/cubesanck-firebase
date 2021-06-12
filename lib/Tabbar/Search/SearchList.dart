import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Pages/ProductDescriptionPage.dart';
import 'package:cubesnack/Tabbar/WishList/Views/WishListCard.dart';
import 'package:flutter/material.dart';

class SearchList extends StatelessWidget {
  final List<Products> products;
  const SearchList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          Products product = products[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDescriptionPage(
                            id: product.id,
                          )));
            },
            child: WishListCard(
              item: product,
            ),
          );
        },
        itemCount: products?.length ?? 0,
      ),
    );
  }
}
