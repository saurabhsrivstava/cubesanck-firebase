import 'dart:async';
import 'dart:developer' as developer;
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Listing/AllListing/Models/ProductListingResponse.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class ListingEvent {
  Stream<ListingState> applyAsync(
      {ListingState currentState, ListingBloc bloc});
}

class UnListingEvent extends ListingEvent {
  @override
  Stream<ListingState> applyAsync(
      {ListingState currentState, ListingBloc bloc}) async* {
    yield ListingDefaultState();
  }
}

class LoadListingEvent extends ListingEvent {
  final Map<FilterType, dynamic> filters;
  LoadListingEvent({this.filters});

  @override
  Stream<ListingState> applyAsync(
      {ListingState currentState, ListingBloc bloc}) async* {
    try {
      yield ListingLoadingState();
      final ApiResponse response = await AppApi().getAllListingProducts(filters);
      if (response.status == APIStatus.COMPLETED) {
        final data =
            ProductListingResponse.fromJson({"productListing": response.data});
        yield ListingDoneState(data.productListing);
      } else {
        yield ErrorListingState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadListingEvent', error: _, stackTrace: stackTrace);
      yield ErrorListingState(_?.toString());
    }
  }
}
