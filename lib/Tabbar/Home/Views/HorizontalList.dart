import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/Home/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Home/Views/HomeProductCard.dart';
import 'package:cubesnack/Tabbar/WishList/Views/WebWishListCard.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorizontalList extends StatefulWidget {
  final String categoryName;
  final String categorySuffix;

  const HorizontalList({Key key, this.categoryName, this.categorySuffix})
      : super(key: key);

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc(DefaultHomeState());
    bloc.add(LoadHomeProductEvent(suffix: this.widget.categorySuffix));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Products> products;
    return BlocConsumer(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return AppLoader();
        }

        if (state is HomeProductDoneState) {
          products = state.products;
        }

        // if (state is ErrorHomeState) {
        //   return AppErrorView(
        //     callBack: () {},
        //     error: state.errorMessage,
        //   );
        // }
        return Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 5,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          // height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                padding: EdgeInsets.only(left: 10, right: 10),
                title: this.widget.categoryName,
                fontWeight: AppFont.medium,
                fontSize: AppFont.title5,
              ),
              if (products != null)
                Expanded(
                  child:
                      ListView(
                        itemExtent: 250,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[..._createProductCard(products)],
                      ),
                  //     ListView.builder(
                  //   key: PageStorageKey(""),
                  //   itemBuilder: (context, position) {
                  //     final item = products[position];
                  //
                  //     return PlatformInfo.isDesktop(context)
                  //         ? WebWishListCard(
                  //             product: item,
                  //           )
                  //         : HomeProductCard(
                  //             product: item,
                  //           );
                  //   },
                  //   itemExtent: 200,
                  //   scrollDirection: Axis.horizontal,
                  // ),
                ),
            ],
          ),
        );
      },
      listener: (context, state) {},
      cubit: bloc,
    );
  }

  _createProductCard(List<Products> products) {
    return products
        .map((e) => HomeProductCard(
              product: e,
              key: PageStorageKey(e.title),
            ))
        .toList();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
