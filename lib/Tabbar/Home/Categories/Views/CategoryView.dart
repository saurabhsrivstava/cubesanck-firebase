import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryView extends StatelessWidget {
  final data = [
    {
      "name": "Categories",
      "icon": "list",
      "route": AppRoutes.categoryDetailList
    },
    {
      "name": "Best Deals",
      "icon": "bestDeals",
      "route": AppRoutes.categoryDetailList
    },
    {"name": "Favorites", "icon": "favourite", "route": AppRoutes.favourite},
    {"name": "Buy Again", "icon": "buy", "route": AppRoutes.buyerOrdersList},
    {"name": "Gifts", "icon": "gift-box", "route": AppRoutes.categoryDetailList}
  ];
  CategoryView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 50,
      child: ListView(
        children: [
          ...data
              .map(
                (e) => _CategoryCard(
                  title: e["name"],
                  icon: e["icon"],
                  route: e["route"],
                ),
              )
              .toList()
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final String route;
  const _CategoryCard({Key key, this.title = '', this.icon, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: FlatButton.icon(
            onPressed: () => this._showCategoryDetails(context),
            icon: SvgPicture.asset(
              "assets/home/$icon.svg",
              height: 15,
              width: 15,
            ),
            label: AppTitle(
              title: title,
              color: AppColors.darkBlue,
            )),
      ),
    );
  }

  _showCategoryDetails(context) {
    Navigator.pushNamed(context, route);
  }
}
