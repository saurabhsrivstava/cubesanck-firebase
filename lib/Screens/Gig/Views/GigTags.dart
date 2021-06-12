import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Gig/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/ProductDetails/Views/TagSearchBar.dart';
import 'package:flutter/material.dart';

class GigTags extends StatefulWidget {
  GigTags({Key key}) : super(key: key);

  @override
  _GigTagsState createState() => _GigTagsState();
}

class _GigTagsState extends State<GigTags> {
  GigBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = GigBloc(GigDefaultState());
    bloc.add(LoadGigTagsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "Search Tags",
          ),
          TagSearchBar(),
        ],
      ),
    );
  }
}
