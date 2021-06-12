import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Filters/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFilterDropdown extends StatefulWidget {
  final Function filterCallBack;

  const CategoryFilterDropdown({Key key, @required this.filterCallBack})
      : super(key: key);

  @override
  _CategoryFilterDropdownState createState() => _CategoryFilterDropdownState();
}

class _CategoryFilterDropdownState extends State<CategoryFilterDropdown> {
  FilterBloc bloc;

  @override
  void initState() {
    bloc = FilterBloc(FilterDefaultState());
    bloc.add(LoadCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        builder: (context, state) {
          List<MCategoryData> categories;
          if (state is FilterCategoryDoneState) {
            categories = state.categories;
          }

          if (categories != null) {
            final data = categories.map((e) => e.category.name).toList();
            return Container(
              width: 100,
              child: AppDropdown(
                data: data,
                height: 30,
                fontSize: 10,
                title: 'Categories',
                valueCallBack: (v, index) => this.widget.filterCallBack(
                    categories[index].category.id, FilterType.category),
              ),
              margin: EdgeInsets.only(right: 10, left: 10),
            );
          } else {
            return Container();
          }
        },
        cubit: bloc);
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
