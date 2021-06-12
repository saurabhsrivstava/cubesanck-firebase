import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageSellerOrderBuilder.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Tabbar/Search/Search/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {
  Stream<SearchState> applyAsync({SearchState currentState, SearchBloc bloc});
}

class UnSearchEvent extends SearchEvent {
  @override
  Stream<SearchState> applyAsync(
      {SearchState currentState, SearchBloc bloc}) async* {
    yield UnSearchState();
  }
}

class LoadSearchEvent extends SearchEvent {
  final String text;
  LoadSearchEvent({this.text});
  @override
  Stream<SearchState> applyAsync(
      {SearchState currentState, SearchBloc bloc}) async* {
    try {
      yield SearchLoadingState();
      final ApiResponse response = await AppApi().searchProduct(text: text);
      if (response.status == APIStatus.COMPLETED) {
        final data = MOrder.fromJson({"items": response.data});
        yield SearchDoneState(products: data.items);
      } else {
        yield ErrorSearchState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSearchEvent', error: _, stackTrace: stackTrace);
      yield ErrorSearchState(_?.toString());
    }
  }
}
