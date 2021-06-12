import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Filters/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:cubesnack/Tabbar/Home/Views/HomeProductCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({Key key}) : super(key: key);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  FilterBloc bloc;

  @override
  void initState() {
    bloc = FilterBloc(FilterDefaultState());
    bloc.add(LoadCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "browseCategories",
          isCart: true,
        ),
        body: BlocConsumer(
          builder: (context, state) {
            List<MCategoryData> categories;
            if (state is FilterLoadingState) {
              return AppLoader();
            }
            if (state is FilterCategoryDoneState) {
              categories = state.categories;
            }
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (context, position) {
                      final category = categories[position];
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //color: Colors.red,
                            ),
                            child: category.category.logo != null
                                ? Image.network(category.category.logo)
                                : SvgPicture.asset("assets/signup/blank.svg"),
                          ),
                          AppTitle(
                            title: category.category.name,
                            fontSize: 12,
                          )
                        ],
                      );
                    },
                    itemCount: categories?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                  ),
                ),
              ],
            );
          },
          listener: (context, state) {},
          cubit: bloc,
        ));
  }
}
