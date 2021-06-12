import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Tabbar/Home/Models/MHomeProductList.dart';
import 'package:cubesnack/Tabbar/Home/Models/MHomeSuffixResponse.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class HomeEvent {
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class UnHomeEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    yield DefaultHomeState();
  }
}

class LoadHomeCategoriesEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    try {
      yield DefaultHomeState();
      final ApiResponse response = await AppApi().getHomeSuffix();
      if (response.status == APIStatus.COMPLETED) {
        final MHomeSuffixResponse data =
            MHomeSuffixResponse.fromJson(response.data);
        yield DoneHomeState(categories: data.categories);
      } else {
        yield ErrorHomeState(response.message);
      }

      yield DoneHomeState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_?.toString());
    }
  }
}

class LoadHomeProductEvent extends HomeEvent {
  final String suffix;
  LoadHomeProductEvent({this.suffix});
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    try {
      yield DefaultHomeState();
      final ApiResponse response = await AppApi().getHomeProduct(suffix);
      if (response.status == APIStatus.COMPLETED) {
        final MHomeProductList data =
            MHomeProductList.fromJson({"products": response.data});
        yield HomeProductDoneState(products: data.products);
      } else {
        yield ErrorHomeState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_?.toString());
    }
  }
}

class LoadProductDetailsEvent extends HomeEvent {
  final String id;
  LoadProductDetailsEvent({this.id});
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    try {
      yield DefaultHomeState();
      final ApiResponse response = await AppApi().getProductDetails(id);
      if (response.status == APIStatus.COMPLETED) {
        final Products product = Products.fromJson(response.data);
        yield ProductDescriptionDoneState(product: product);
      } else {
        yield ErrorHomeState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_?.toString());
    }
  }
}

class AddToCartEvent extends HomeEvent {
  final body;
  final Products product;
  AddToCartEvent({this.body, this.product});
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    try {
      //yield DefaultHomeState();
      final ApiResponse response = await AppApi().addToCart(body: body);
      if (response.status == APIStatus.COMPLETED) {
        // final Products product =
        //     Products.fromJson(response.data);
        UserSession.shared.refreshCart();
        yield AddingCartDoneState(product: product);
      } else {
        yield ErrorHomeState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_?.toString());
    }
  }
}

class ProductShippingInfoEvent extends HomeEvent {
  final String productId;
  ProductShippingInfoEvent({this.productId});
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    try {
      yield DefaultHomeState();
      final ApiResponse response =
          await AppApi().getEstimatedDelivery(productId: productId);
      if (response.status == APIStatus.COMPLETED) {
        final MHomeProductList data =
            MHomeProductList.fromJson({"products": response.data});
        yield HomeProductDoneState(products: data.products);
      } else {
        yield ErrorHomeState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_?.toString());
    }
  }
}
