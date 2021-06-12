import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/RattingRow.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProductReview extends StatelessWidget {
  final Products product;
  const ProductReview({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final total = product.reviews != null ? product.reviews.length : 0;
    final avg = product.reviewsSummary.totalAvg / product.reviews.length;

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "Customer Reviews",
            fontSize: AppFont.title3,
            fontWeight: AppFont.bold,
          ),
          Column(
            children: [
              Center(
                child: AppTitle(
                  title: "$avg",
                  fontSize: 60,
                  fontWeight: AppFont.bold,
                ),
              ),
              RattingRow(
                isCount: false,
                rattig: avg.toDouble(),
              ),
              AppTitle(
                title: "Average Ratting",
                fontSize: AppFont.title3,
                fontWeight: AppFont.medium,
              ),
              AppTitle(
                title: "Based on $total Reviews",
                fontSize: AppFont.title3,
                fontWeight: AppFont.medium,
              ),
            ],
          ),
          _ReviewProgress(
            title: "Excellent",
            count: product.reviewsSummary.excellent,
          ),
          _ReviewProgress(
            title: "Good",
            count: product.reviewsSummary.good,
          ),
          _ReviewProgress(
            title: "Average",
            count: product.reviewsSummary.average,
          ),
          _ReviewProgress(
            title: "Below Average",
            count: product.reviewsSummary.belowAverage,
          ),
          _ReviewProgress(
            title: "Poor",
            count: product.reviewsSummary.poor,
          ),
        ],
      ),
    );
  }
}

class _ReviewProgress extends StatelessWidget {
  final String title;
  final int count;
  const _ReviewProgress({Key key, this.title = "", this.count = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: AppTitle(
              title: title,
              fontSize: AppFont.title2,
              fontWeight: AppFont.bold,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 3,
            child: LinearPercentIndicator(
              leading: AppTitle(title: "($count)"),
              lineHeight: 6.0,
              percent: count / 100,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
