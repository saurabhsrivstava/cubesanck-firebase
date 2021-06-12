import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Listing/AllListing/Views/AllListingBuilder.dart';
import 'package:cubesnack/Screens/Listing/AllListing/Views/ListingFilter.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/index.dart';

class AllListingPage extends StatefulWidget {
  const AllListingPage({Key key}) : super(key: key);

  @override
  _AllListingPageState createState() => _AllListingPageState();
}

class _AllListingPageState extends State<AllListingPage> {
  ListingBloc bloc;
  Map<FilterType, dynamic> filters;
  @override
  void initState() {
    bloc = ListingBloc(ListingDefaultState());
    filters = Map<FilterType, dynamic>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "allListing",
        isCart: true,
      ),
      body: Column(
        children: [
          ListingFilter(
            filterCallBack: (v, FilterType type) {
              filters[type] = v;
              bloc..add(LoadListingEvent(filters: filters));
              appPrint(filters);
            },
            refrreshPress: () {
              bloc..add(LoadListingEvent(filters: null));
            },
          ),
          Expanded(
            child: Container(
              child: BlocProvider(
                create: (context) => bloc,
                child: BlocBuilder(
                  builder: (context, state) {
                    if (state is ListingLoadingState) {
                      return AppLoader();
                    } else if (state is ListingDoneState) {
                      return AllListingBuilder(
                        listing: state.productListing,
                      );
                    } else if (state is ErrorListingState) {
                      return Container();
                    } else {
                      return AppLoader();
                    }
                  },
                  cubit: bloc..add(LoadListingEvent()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
