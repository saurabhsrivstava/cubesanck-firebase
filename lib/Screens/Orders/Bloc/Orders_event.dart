import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Tabbar/Home/Models/MHomeProductList.dart';
import 'package:cubesnack/Utils/AppDate.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class OrdersEvent {
  Stream<OrdersState> applyAsync({OrdersState currentState, OrdersBloc bloc});
}

class UnOrdersEvent extends OrdersEvent {
  @override
  Stream<OrdersState> applyAsync(
      {OrdersState currentState, OrdersBloc bloc}) async* {
    yield OrdersDefaultState();
  }
}

class LoadSellerOrdersEvent extends OrdersEvent {
  final String orderId;
  LoadSellerOrdersEvent({this.orderId});
  @override
  Stream<OrdersState> applyAsync(
      {OrdersState currentState, OrdersBloc bloc}) async* {
    try {
      yield OrdersLoadingState();
      final ApiResponse response =
          await AppApi().getSellerOrders(orderId: orderId);
      if (response.status == APIStatus.COMPLETED) {
        final data = MOrderResponse.fromJson(response.data);
        yield OrdersDoneState(items: data.items);
      } else {
        yield ErrorOrdersState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadOrdersEvent', error: _, stackTrace: stackTrace);
      yield ErrorOrdersState(_?.toString());
    }
  }
}

class LoadBuyerOrdersEvent extends OrdersEvent {
  final String orderId;
  LoadBuyerOrdersEvent({this.orderId});

  @override
  Stream<OrdersState> applyAsync(
      {OrdersState currentState, OrdersBloc bloc}) async* {
    try {
      yield OrdersLoadingState();
      final ApiResponse response =
          await AppApi().getBuyersOrders(orderId: orderId);
      if (response.status == APIStatus.COMPLETED) {
        final data = MOrderResponse.fromJson(response.data);
        yield OrdersDoneState(items: data.items);
      } else {
        yield ErrorOrdersState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadOrdersEvent', error: _, stackTrace: stackTrace);
      yield ErrorOrdersState(_?.toString());
    }
  }
}

class UpdateOrderStatusEvent extends OrdersEvent {
  final String productId;
  final String orderId;
  final int status;
  UpdateOrderStatusEvent({this.productId, this.orderId, this.status});

  @override
  Stream<OrdersState> applyAsync(
      {OrdersState currentState, OrdersBloc bloc}) async* {
    try {
      yield OrdersLoadingState();
      final ApiResponse response = await AppApi().updateOrderStatus(
          productId: productId, orderId: orderId, status: status);
      if (response.status == APIStatus.COMPLETED) {
        yield OrderStatusUpdatedState(message: response.data["message"]);
      } else {
        yield ErrorOrdersState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadOrdersEvent', error: _, stackTrace: stackTrace);
      yield ErrorOrdersState(_?.toString());
    }
  }
}

class CreateReturnRequestEvent extends OrdersEvent {
  final MOrder order;
  final Products product;
  final String reason;

  CreateReturnRequestEvent({this.order, this.product, this.reason});

  @override
  Stream<OrdersState> applyAsync(
      {OrdersState currentState, OrdersBloc bloc}) async* {
    try {
      yield OrdersLoadingState();

      final body = {
        "product_id": product.id,
        "price": order.totalAmount,
        "reason": this.reason,
        "order_id": order.orderId,
        "seller_id": product.sellerId,
        "status": 1,
        "return_date": AppDate.todayDate()
      };

      final ApiResponse response =
          await AppApi().creatReturnRequest(body: body);
      if (response.status == APIStatus.COMPLETED) {
        yield OrderStatusUpdatedState(message: response.data["message"]);
      } else {
        yield ErrorOrdersState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadOrdersEvent', error: _, stackTrace: stackTrace);
      yield ErrorOrdersState(_?.toString());
    }
  }
}
