import 'dart:async';
import 'dart:developer' as developer;
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Tabbar/Home/Models/MHomeProductList.dart';
import 'package:meta/meta.dart';
import 'index.dart';

@immutable
abstract class WishListEvent {
  Stream<WishListState> applyAsync(
      {WishListState currentState, WishListBloc bloc});
}

class UnWishListEvent extends WishListEvent {
  @override
  Stream<WishListState> applyAsync(
      {WishListState currentState, WishListBloc bloc}) async* {
    yield WishListDefaultState();
  }
}

class LoadWishListEvent extends WishListEvent {
  @override
  Stream<WishListState> applyAsync(
      {WishListState currentState, WishListBloc bloc}) async* {
    try {
      yield WishListLoadingState();
      ApiResponse response = await AppApi().getFavorite();
      if (response.status == APIStatus.COMPLETED) {
        final data = MHomeProductList.fromJson({"products": response.data});

        yield WishListDoneState(data.products);
      } else {
        yield ErrorWishListState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadWishListEvent', error: _, stackTrace: stackTrace);
      yield ErrorWishListState(_?.toString());
    }
  }
}

class AddWishListEvent extends WishListEvent {
  final Products product;
  AddWishListEvent({this.product});

  @override
  Stream<WishListState> applyAsync(
      {WishListState currentState, WishListBloc bloc}) async* {
    try {
      yield WishListLoadingState();
      final body = {
        "product_id": product.id,
        "quantity": 0,
        "variant_id":
            product.variants.length > 0 ? product.variants.first.id : ""
      };
      if (product.variants.length == 0) {
        body.remove("variant_id");
      }
      product.isWishListed
          ? await AppApi().reemoveFavorite(body, product.id)
          : await AppApi().addToFavorite(body);
      yield AddFavoriteDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadWishListEvent', error: _, stackTrace: stackTrace);
      yield ErrorWishListState(_?.toString());
    }
  }
}
