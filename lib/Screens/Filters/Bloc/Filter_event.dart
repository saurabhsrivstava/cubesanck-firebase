import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class FilterEvent {
  Stream<FilterState> applyAsync({FilterState currentState, FilterBloc bloc});
}

class UnFilterEvent extends FilterEvent {
  @override
  Stream<FilterState> applyAsync(
      {FilterState currentState, FilterBloc bloc}) async* {
    yield FilterDefaultState();
  }
}

class LoadCategoryEvent extends FilterEvent {
  @override
  Stream<FilterState> applyAsync(
      {FilterState currentState, FilterBloc bloc}) async* {
    try {
      yield FilterLoadingState();
      final ApiResponse response = await AppApi().getAllCategories();
      final res = MCategoryResponse.fromJson(response.data);
      if (response.status == APIStatus.COMPLETED) {
        yield FilterCategoryDoneState(categories: res.categories);
      } else {
        yield ErrorFilterState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFilterEvent', error: _, stackTrace: stackTrace);
      yield ErrorFilterState(_?.toString());
    }
  }
}

class LoadStoreEvent extends FilterEvent {
  @override
  Stream<FilterState> applyAsync(
      {FilterState currentState, FilterBloc bloc}) async* {
    try {
      yield FilterLoadingState();
      final ApiResponse response = await AppApi().getStores();
      if (response.status == APIStatus.COMPLETED) {
        final stores = response.data
            .map((store) =>
                MStore(displayName: store["display_name"], id: store["id"]))
            .toList()
            .cast<MStore>()
            .toList();
        appPrint(stores);
        yield FilterStoreDoneState(stores: stores);
      } else {
        yield ErrorFilterState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFilterEvent', error: _, stackTrace: stackTrace);
      yield ErrorFilterState(_?.toString());
    }
  }
}
