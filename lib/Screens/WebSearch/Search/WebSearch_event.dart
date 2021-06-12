import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/WebSearch/Search/index_web.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class WebSearchEvent {
  Stream<WebSearchState> applyAsync({WebSearchState currentState, WebSearchBloc bloc});
}

class UnSearchEvent extends WebSearchEvent {
  @override
  Stream<WebSearchState> applyAsync(
      {WebSearchState currentState, WebSearchBloc bloc}) async* {
    yield UnSearchState();
  }
}

class LoadSearchEvent extends WebSearchEvent {
  final String text;
  LoadSearchEvent({this.text});
  @override
  Stream<WebSearchState> applyAsync(
      {WebSearchState currentState, WebSearchBloc bloc}) async* {
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
