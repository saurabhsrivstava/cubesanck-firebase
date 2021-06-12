import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/RattingRow.dart';
import 'package:cubesnack/Screens/Products/Models/MReview.dart';
import 'package:flutter/material.dart';

class ProductReviewCell extends StatelessWidget {
  final MReview review;
  const ProductReviewCell({Key key, this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              // color: Colors.red,
              margin: EdgeInsets.only(right: 10),
              child: ClipRRect(
                child: Image.network(
                  review.profile,
                  height: 40,
                  width: 40,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle(
                    title:
                        review.userName != null ? review.userName : "No Name"),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width - 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RattingRow(
                        rattig: review.rating.toDouble(),
                      ),
                      Spacer(),
                      AppTitle(title: review.createdAt),
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
