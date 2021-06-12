import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Tabbar/Home/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Home/Models/MHomeSuffixResponse.dart';
import 'package:cubesnack/Tabbar/Home/Views/HorizontalList.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListBuilder extends StatefulWidget {
  const HomeListBuilder({Key key}) : super(key: key);

  @override
  _HomeListBuilderState createState() => _HomeListBuilderState();
}

class _HomeListBuilderState extends State<HomeListBuilder> {
  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc(DefaultHomeState());
    bloc.add(LoadHomeCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        List<Categories> categories;
        if (state is HomeLoadingState) {
          return AppLoader();
        }

        if (state is DoneHomeState) {
          categories = state.categories;
        }

        return Padding(
          padding: PlatformInfo.isDesktop(context)
              ? const EdgeInsets.only(bottom: 0)
              : const EdgeInsets.only(bottom: 80),
          child: PlatformInfo.isDesktop(context)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      if (categories != null)
                        ..._createHorizontalList(categories)
                    ],
                  ),
                )
              : Column(
                  children: [
                    if (categories != null) ..._createHorizontalList(categories)
                  ],
                ),

          // CustomScrollView(
          //   slivers: <Widget>[
          //     // SliverAppBar(
          //     //   title: Text("MovieList"),
          //     //   backgroundColor: Color(0xFF5CA0D3),
          //     //   expandedHeight: 200,
          //     //   flexibleSpace: FlexibleSpaceBar(
          //     //       background: Image.network(
          //     //     "https://images.unsplash.com/photo-1517404215738-15263e9f9178?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
          //     //     fit: BoxFit.fill,
          //     //   )),
          //     // ),
          //     if (categories != null)
          //       SliverFixedExtentList(
          //         itemExtent: 250,
          //         delegate: SliverChildListDelegate(

          //             [..._createHorizontalList(categories)]),
          //       )
          //   ],
          // ),
        );
      },
      listener: (context, state) {},
      cubit: bloc,
    );
  }

  _createHorizontalList(List<Categories> categories) {
    return categories
        .map(
          (e) => HorizontalList(
            key: PageStorageKey(e.apiSuffix),
            categoryName: e.displayName,
            categorySuffix: e.apiSuffix,
          ),
        )
        .toList();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
