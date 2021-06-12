import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/Models/MStoreList.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class StoreEvent {
  Stream<StoreState> applyAsync({StoreState currentState, StoreBloc bloc});
}

class UnStoreEvent extends StoreEvent {
  @override
  Stream<StoreState> applyAsync(
      {StoreState currentState, StoreBloc bloc}) async* {
    yield StoreDefaultState();
  }
}

class LoadStoreListEvent extends StoreEvent {
  @override
  Stream<StoreState> applyAsync(
      {StoreState currentState, StoreBloc bloc}) async* {
    try {
      yield StoreLoadingState();
      final ApiResponse response = await AppApi().getStores();
      if (response.status == APIStatus.COMPLETED) {
        final stores = MStoreList.fromJson({"stores": response.data});
        yield StoreDoneState(stores: stores);
      } else {
        yield ErrorStoreState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadStoreEvent', error: _, stackTrace: stackTrace);
      yield ErrorStoreState(_?.toString());
    }
  }
}
