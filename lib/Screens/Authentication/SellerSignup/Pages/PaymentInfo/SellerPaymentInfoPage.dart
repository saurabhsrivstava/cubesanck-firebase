import 'package:cubesnack/Screens/Payments/Screens/CardList/Pages/CardListPage.dart';
import 'package:flutter/material.dart';

class SellerPaymentInfoPage extends StatelessWidget {
  const SellerPaymentInfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CardListPage(
        isNavBar: false,
        isNew: true,
      ),
      height: MediaQuery.of(context).size.height,
    );
  }
}
