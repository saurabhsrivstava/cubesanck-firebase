import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Filters/Bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreFilterDropdown extends StatefulWidget {
  final Function filterCallBack;

  const StoreFilterDropdown({Key key, @required this.filterCallBack})
      : super(key: key);

  @override
  _StoreFilterDropdownState createState() => _StoreFilterDropdownState();
}

class _StoreFilterDropdownState extends State<StoreFilterDropdown> {
  FilterBloc bloc;

  @override
  void initState() {
    bloc = FilterBloc(FilterDefaultState());
    bloc.add(LoadStoreEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        builder: (context, state) {
          List<MStore> stores;
          if (state is FilterStoreDoneState) {
            stores = state.stores;
          }
          if (stores != null) {
            final data = stores.map((e) => e.displayName).toList();
            return Container(
              width: 100,
              child: AppDropdown(
                data: data,
                height: 30,
                fontSize: 10,
                title: 'Stores',
                valueCallBack: (v, index) => this
                    .widget
                    .filterCallBack(stores[index].id, FilterType.store),
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
