import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/CommonViews/RattingRow.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PromoteListing/PromoteListingPage.dart';
import 'package:cubesnack/Screens/Listing/AllListing/Models/ProductListingResponse.dart';
import 'package:cubesnack/Screens/Products/Pages/ProductDescriptionPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';

class ListingProductCell extends StatelessWidget {
  final MProductListing product;
  const ListingProductCell({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appPrint(product.image.image);
    appPrint(product.title);
    return Container(
      alignment: Alignment.center,
      // margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(5),
      height: 120,
      child: Card(
        elevation: 3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 70,
                width: 60,
                margin: EdgeInsets.only(right: 5, left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.greyBorder)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDescriptionPage(
                                  id: product.id,
                                )));
                  },
                  child: Image.network(
                    product.image.image,
                    fit: BoxFit.cover,
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width * 0.63,
                      child: AppTitle(
                        title: product?.title ?? "",
                        fontSize: AppFont.title2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          AppTitle(
                            title: "Share",
                            fontSize: AppFont.title1,
                          ),
                          Icon(
                            Icons.share,
                            size: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5),
                RattingRow(
                  rattig: product.rating.toDouble(),
                  isCount: false,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    children: [
                      AppTitle(
                        title: "\$ ${product.price}",
                        fontSize: AppFont.title3,
                      ),
                      Spacer(),
                      AppRoundButton(
                        title: "promoteListing",
                        height: 25,
                        backgroundColor: Colors.white,
                        fontSize: 8,
                        isBorder: true,
                        borderColor: AppColors.greyBorder,
                        isRightIcon: false,
                        width: 95,
                        margin: 5,
                        titleColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  body: PromoteListingPage(
                                    id: product.id,
                                  ),
                                  appBar: Navbar(
                                    title: "promoteListing",
                                  ),
                                ),
                              ));
                        },
                      ),
                      AppRoundButton(
                        margin: 5,
                        width: 95,
                        title: "manageListing",
                        isRightIcon: false,
                        height: 25,
                        fontSize: 8,
                        backgroundColor: Colors.white,
                        isBorder: true,
                        borderColor: AppColors.greyBorder,
                        titleColor: Colors.black,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
