import 'package:cubesnack/Tabbar/Home/Categories/Views/CategoryView.dart';
import 'package:cubesnack/Tabbar/Home/Views/HomeBannerView.dart';
import 'package:cubesnack/Tabbar/Home/Views/HomeListBuilder.dart';
import 'package:flutter/cupertino.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeBannerView(),
        CategoryView(),
        Expanded(child: HomeListBuilder()),
      ],
    );
  }
}
