import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/WebNavigationBar.dart';
import 'package:cubesnack/Screens/Filters/Bloc/index.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailWebPage extends StatefulWidget {
  const CategoryDetailWebPage({Key key}) : super(key: key);

  @override
  _CategoryDetailWebPageState createState() => _CategoryDetailWebPageState();
}

class _CategoryDetailWebPageState extends State<CategoryDetailWebPage> {
  FilterBloc bloc;
  final data = [
    {
      "name": "Appliances & Home Apparatus",
      "icon": Image.asset("assets/images/applliances.png"),
    },
    {
      "name": "Art Supplies & Essentials",
      "icon": Image.asset("assets/images/art.png"),
    },
    {
      "name": "Auto Parts & Accessories",
      "icon": Image.asset("assets/images/auto.png")
    },
    {
      "name": "Baby Essentials",
      "icon": Image.asset("assets/images/baby.png"),
    },
    {
      "name": "Appliances & Home Apparatus",
      "icon": Image.asset("assets/images/applliances.png"),
    },
    {
      "name": "Art Supplies & Essentials",
      "icon": Image.asset("assets/images/art.png"),
    },
    {
      "name": "Auto Parts & Accessories",
      "icon": Image.asset("assets/images/auto.png")
    },
    {
      "name": "Baby Essentials",
      "icon": Image.asset("assets/images/baby.png"),
    },
    {
      "name": "Appliances & Home Apparatus",
      "icon": Image.asset("assets/images/applliances.png"),
    },
    {
      "name": "Art Supplies & Essentials",
      "icon": Image.asset("assets/images/art.png"),
    },
    {
      "name": "Auto Parts & Accessories",
      "icon": Image.asset("assets/images/auto.png")
    },
    {
      "name": "Baby Essentials",
      "icon": Image.asset("assets/images/baby.png"),
    },
    {
      "name": "Appliances & Home Apparatus",
      "icon": Image.asset("assets/images/applliances.png"),
    },
    {
      "name": "Art Supplies & Essentials",
      "icon": Image.asset("assets/images/art.png"),
    },
    {
      "name": "Auto Parts & Accessories",
      "icon": Image.asset("assets/images/auto.png")
    },
    {
      "name": "Baby Essentials",
      "icon": Image.asset("assets/images/baby.png"),
    },
  ];

  @override
  void initState() {
    bloc = FilterBloc(FilterDefaultState());
    bloc.add(LoadCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: WebNavigationBar(),
        body: BlocConsumer(
          builder: (context, state) {
            // List<MCategoryData> categories;
            // if (state is FilterLoadingState) {
            //   return AppLoader();
            // }
            // if (state is FilterCategoryDoneState) {
            //   categories = state.categories;
            // }
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.product_category),
                  child: AppTitle(
                      title: "Product Category",
                      color: Colors.black,
                      fontWeight: AppFont.regular,
                      fontSize: AppFont.header,
                      padding: EdgeInsets.only(top: 40, bottom: 40)),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(
                        left: size.height / 5, right: size.height / 5),
                    itemBuilder: (context, position) {
                      // final category = categories[position];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              shadowColor: Colors.grey,
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  print('Card tapped.');
                                },
                                child: Container(
                                  child: data[position]["icon"],
                                ),
                              )),
                          AppTitle(
                            title: data[position]["name"],
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            fontSize: AppFont.title2,
                            fontWeight: AppFont.regular,
                          ),
                        ],
                      );
                    },
                    itemCount: 16,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        crossAxisCount: 4),
                  ),
                ),
              ],
            );
          },
          listener: (context, state) {},
          cubit: bloc,
        ),
      ),
    );
  }
}
