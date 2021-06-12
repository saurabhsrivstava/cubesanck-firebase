import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Cart/Models/CartPayment.dart';
import 'package:cubesnack/Screens/Cart/Models/MCartOrder.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Screens/Payments/Models/MCardList.dart';
import 'package:cubesnack/Screens/Payments/Screens/CardList/Views/CreditCardWidget.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class PaymentEvent {
  Stream<PaymentState> applyAsync(
      {PaymentState currentState, PaymentBloc bloc});
}

class UnPaymentEvent extends PaymentEvent {
  @override
  Stream<PaymentState> applyAsync(
      {PaymentState currentState, PaymentBloc bloc}) async* {
    yield CardDefaultState();
  }
}

class LoadCardListEvent extends PaymentEvent {
  @override
  Stream<PaymentState> applyAsync(
      {PaymentState currentState, PaymentBloc bloc}) async* {
    try {
      yield CardLoadingState();
      ApiResponse response = await AppApi().getAllCards();
      if (response.status == APIStatus.COMPLETED) {
        final MCardList res = MCardList.fromJson({"cards": response.data});
        yield CardFetchDoneState(cards: res.cards);
      } else {
        yield ErrorPaymentState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPaymentEvent', error: _, stackTrace: stackTrace);
      yield ErrorPaymentState(_?.toString());
    }
  }
}

class AddCardEvent extends PaymentEvent {
  final CreditCardModel card;
  AddCardEvent({this.card});

  @override
  Stream<PaymentState> applyAsync(
      {PaymentState currentState, PaymentBloc bloc}) async* {
    try {
      yield CardLoadingState();
      ApiResponse response = await AppApi().addCard(card.toJson());
      if (response.status == APIStatus.COMPLETED) {
      } else {}
      yield AddCardDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPaymentEvent', error: _, stackTrace: stackTrace);
      yield ErrorPaymentState(_?.toString());
    }
  }
}

class DeleteCardEvent extends PaymentEvent {
  final String id;
  final List<MCard> cards;
  DeleteCardEvent({this.id, this.cards});
  @override
  Stream<PaymentState> applyAsync(
      {PaymentState currentState, PaymentBloc bloc}) async* {
    try {
      yield CardLoadingState();
      ApiResponse response = await AppApi().deleteCard(id);
      if (response.status == APIStatus.COMPLETED) {
        this.cards.removeWhere((element) => element.id == id);
        yield CardFetchDoneState(cards: this.cards);
      } else {
        yield ErrorPaymentState("Error in card deletion");
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPaymentEvent', error: _, stackTrace: stackTrace);
      yield ErrorPaymentState(_?.toString());
    }
  }
}

class PickCardEvent extends PaymentEvent {
  final MCard card;
  PickCardEvent({this.card});
  @override
  Stream<PaymentState> applyAsync(
      {PaymentState currentState, PaymentBloc bloc}) async* {
    try {
      yield CardSelectedDoneState(card: card);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPaymentEvent', error: _, stackTrace: stackTrace);
      yield ErrorPaymentState(_?.toString());
    }
  }
}

class MakeCartPaymentEvent extends PaymentEvent {
  final CartPayment order;

  MakeCartPaymentEvent({this.order});
  @override
  Stream<PaymentState> applyAsync(
      {PaymentState currentState, PaymentBloc bloc}) async* {
    try {
      yield CardLoadingState();
      final orderBody = order.toJson();
      final ApiResponse response = await AppApi().makePayment(orderBody);
      if (response.status == APIStatus.COMPLETED) {
        String orderId;
        if (response.data != null && response.data.containsKey("id")) {
          orderId = response.data["id"];
        }
        yield CartPaymentDoneState(isInvoice: false, orderId: orderId);
      } else {
        yield ErrorPaymentState(
          response.message,
        );
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorPaymentState(
        _?.toString(),
      );
    }
  }
}

class CreateCartInvoiceEvent extends PaymentEvent {
  final invoiceData;
  final String orderId;

  CreateCartInvoiceEvent({this.invoiceData, this.orderId});
  @override
  Stream<PaymentState> applyAsync(
      {PaymentState currentState, PaymentBloc bloc}) async* {
    try {
      yield CardLoadingState();
      invoiceData["items"].forEach((obj) => obj["order_id"] = orderId);
      final ApiResponse response =
          await AppApi().createCartInvoiceData(invoiceData);
      if (response.status == APIStatus.COMPLETED) {
        yield CartPaymentDoneState(isInvoice: true);
      } else {
        yield ErrorPaymentState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCartEvent', error: _, stackTrace: stackTrace);
      yield ErrorPaymentState(
        _?.toString(),
      );
    }
  }
}

extension CreditCardModelExt on CreditCardModel {
  toJson() {
    final dates = this.expiryDate.split("/");
    return {
      "object": "card",
      "name": this.cardHolderName,
      "exp_year": int.parse(dates[1]),
      "exp_month": int.parse(dates[0]),
      "number": this.cardNumber
    };
  }
}
