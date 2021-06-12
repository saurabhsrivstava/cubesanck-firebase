import 'package:cubesnack/Screens/Listing/AllListing/Models/ProductListingResponse.dart';
import 'package:flutter/material.dart';

import 'ListingProductCell.dart';

class AllListingBuilder extends StatelessWidget {
  final List<MProductListing> listing;
  const AllListingBuilder({Key key, this.listing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<ListingBloc>(context);
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final product = listing[index];
          return ListingProductCell(
            product: product,
          );
        },
        itemCount: listing.length,
      ),
    );
  }
}
