import 'package:cubesnack/Screens/Products/Models/MReview.dart';
import 'package:cubesnack/Screens/Products/Views/ProductReviewCell.dart';
import 'package:flutter/material.dart';

class ProductReviewList extends StatelessWidget {
  final List<MReview> reviews;
  const ProductReviewList({Key key, this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ..._createReviews(),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }

  _createReviews() {
    return reviews
        .map((e) => ProductReviewCell(
              review: e,
            ))
        .toList();
  }
}
