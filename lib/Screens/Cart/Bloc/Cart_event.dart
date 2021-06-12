import 'dart:async';
import 'dart:developer' as developer;
import 'package:cubesnack/Screens/Cart/Models/CartPayment.dart';
import 'package:cubesnack/Screens/Cart/Models/FastShippingResponse.dart';
import 'package:cubesnack/Screens/Cart/Models/MCartOrder.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:meta/meta.dart';
import 'index.dart';

@immutable
abstract class CartEvent {
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc});
}

class UnCartEvent extends CartEvent {
  @override
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc}) async* {
    yield CartDefaultState();
  }
}

class LoadCartEvent extends CartEvent {
  @override
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc}) async* {
    try {
      yield CartLoadingState();
      final ApiResponse response = await AppApi().getCartData();
      if (response.status == APIStatus.COMPLETED) {
        final data = MUserCartResponse.fromJson(response.data);
        yield CartDoneState(items: data.items, cartId: data.cartId);
      } else {
        yield ErrorCartState(errorMessage: response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(errorMessage: _?.toString());
    }
  }
}

class DeleteCartEvent extends CartEvent {
  final String id;
  final List<MCartItem> items;

  DeleteCartEvent({this.id, this.items});
  @override
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc}) async* {
    try {
      yield CartLoadingState();
      final ApiResponse response = await AppApi().deleteCartData(id);
      if (response.status == APIStatus.COMPLETED) {
        appPrint("remove item$id");
        items.removeWhere((e) => e.id == id);
        UserSession.shared.refreshCart();
        yield CartDeleteDoneState(items: items);
      } else {
        yield ErrorCartState(errorMessage: response.message, items: items);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(errorMessage: _?.toString(), items: items);
    }
  }
}

class CartPriceEvent extends CartEvent {
  final List<MCartItem> items;

  CartPriceEvent({this.items});
  @override
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc}) async* {
    try {
      yield CartLoadingState();
      List<dynamic> data = List<dynamic>();
      final filterItems = items
          .where((item) =>
              item.data.isFastShipping == true ||
              item.data.isHomeDelivery == true ||
              item.data.isStorePickup == true)
          .toList();
      filterItems.forEach((element) {
        data.add(element.data.toJson());
      });
      final ApiResponse response =
          await AppApi().getCartPPrice({"items": data});
      if (response.status == APIStatus.COMPLETED) {
        yield CartDeleteDoneState(items: items);
      } else {
        yield ErrorCartState(errorMessage: response.message, items: items);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(errorMessage: _?.toString(), items: items);
    }
  }
}

class UpdateQuantityCartEvent extends CartEvent {
  final String id;
  final int quantity;

  UpdateQuantityCartEvent({this.id, this.quantity});
  @override
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc}) async* {
    try {
      yield CartLoadingState();
      final ApiResponse response =
          await AppApi().updateCartQuantity(quantity: quantity, id: id);
      if (response.status == APIStatus.COMPLETED) {
        yield CartDeleteDoneState();
      } else {
        yield ErrorCartState(
          errorMessage: response.message,
        );
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(
        errorMessage: _?.toString(),
      );
    }
  }
}

class UpdateCartPriceEvent extends CartEvent {
  final List<MCartItem> items;
  UpdateCartPriceEvent({this.items});
  @override
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc}) async* {
    try {
      yield CartLoadingState();
      MCartOrder order = MCartOrder();
      double totalPrice = 0.0;
      double deliveryCharges = 0.0;

      items.forEach((element) {
        totalPrice = totalPrice + element.product.price * element.quantity;
        if (element.fastShipping != null) {
          deliveryCharges = element.fastShipping.rate;
        }
      });
      order.orderDetails = totalPrice;
      order.extraDeliveryCharge = deliveryCharges;
      yield CartPriceDoneState(order: order);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(errorMessage: _?.toString());
    }
  }
}

class CreateCartInvoiceEvent extends CartEvent {
  final String billingId;
  final List<MCartItem> items;
  final MCartOrder order;

  CreateCartInvoiceEvent({this.items, this.billingId, this.order});
  @override
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc}) async* {
    try {
      final data = items.map((e) => e.data.toJson()).toList();
      order.cartId = data.first["cart_id"];
      appPrint(data);
      yield CartLoadingState();
      final ApiResponse response = await AppApi().createCartInvoiceData(
          {"items": data, "billing_address_id": billingId});
      if (response.status == APIStatus.COMPLETED) {
        yield CartInvoiceCreatedState(order: order);
      } else {
        yield ErrorCartState(errorMessage: response.message, items: items);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(errorMessage: _?.toString(), items: items);
    }
  }
}

class GetDeliveryOptionsEvent extends CartEvent {
  final String productId;
  final String addressId;

  GetDeliveryOptionsEvent({this.productId, this.addressId});
  @override
  Stream<CartState> applyAsync({CartState currentState, CartBloc bloc}) async* {
    try {
      final body = {"address_id": addressId, "product_id": productId};
      yield CartLoadingState();
      ApiResponse response = await AppApi().getDeliveryOptions(body: body);
      if (response.status == APIStatus.COMPLETED) {
        final FastShippingResponse data =
            FastShippingResponse.fromJson(response.data);

        yield FastShippingDoneState(items: data.items);
      } else {
        yield ErrorCartState(errorMessage: response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorCartState(errorMessage: _?.toString());
    }
  }
}
