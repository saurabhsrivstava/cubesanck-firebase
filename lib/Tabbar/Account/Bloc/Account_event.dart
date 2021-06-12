import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class AccountEvent {
  Stream<AccountState> applyAsync(
      {AccountState currentState, AccountBloc bloc});
}

class UnAccountEvent extends AccountEvent {
  @override
  Stream<AccountState> applyAsync(
      {AccountState currentState, AccountBloc bloc}) async* {
    yield AccountDefaultState();
  }
}

class LoadBusinessInfoEvent extends AccountEvent {
  @override
  Stream<AccountState> applyAsync(
      {AccountState currentState, AccountBloc bloc}) async* {
    try {
      yield AccountLoadingState();
      await Future.delayed(Duration(seconds: 1));
      yield AccountDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAccountEvent', error: _, stackTrace: stackTrace);
      yield ErrorAccountState(_?.toString());
    }
  }
}

class AddNewAddressEvent extends AccountEvent {
  final MUserAddress address;
  AddNewAddressEvent({this.address});
  @override
  Stream<AccountState> applyAsync(
      {AccountState currentState, AccountBloc bloc}) async* {
    try {
      yield AccountLoadingState();
      // address.id = "13d2b322-7043-4ed0-be62-a89df09e9895";
      String id;

      final Map<String, dynamic> body = address.toJson();
      if (body["id"] == null) {
        body.remove("id");
      } else {
        id = body["id"];
        body.remove("id");
      }
      id != null
          ? await AppApi().updateNewAddress(body: body, id: id)
          : await AppApi().addNewAddress(body: body);
      yield AddressDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAccountEvent', error: _, stackTrace: stackTrace);
      yield ErrorAccountState(_?.toString());
    }
  }
}

class AllAddressEvent extends AccountEvent {
  @override
  Stream<AccountState> applyAsync(
      {AccountState currentState, AccountBloc bloc}) async* {
    try {
      yield AccountLoadingState();
      final ApiResponse response = await AppApi().getAllAddress();
      if (response.status == APIStatus.COMPLETED) {
        final address =
            MUserAddressResponse.fromJson({"address": response.data});
        yield AddressDoneState(address: address.address);
      } else {
        yield ErrorAccountState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAccountEvent', error: _, stackTrace: stackTrace);
      yield ErrorAccountState(_?.toString());
    }
  }
}

class DeleteAddressEvent extends AccountEvent {
  final String addressId;
  DeleteAddressEvent({this.addressId});
  @override
  Stream<AccountState> applyAsync(
      {AccountState currentState, AccountBloc bloc}) async* {
    try {
      yield AccountLoadingState();
      final ApiResponse response = await AppApi().deleteAddress(id: addressId);
      if (response.status == APIStatus.COMPLETED) {
        yield AddressDoneState();
      } else {
        yield ErrorAccountState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAccountEvent', error: _, stackTrace: stackTrace);
      yield ErrorAccountState(_?.toString());
    }
  }
}

class AddressPickedEvent extends AccountEvent {
  final MUserAddress address;
  AddressPickedEvent({this.address});
  @override
  Stream<AccountState> applyAsync(
      {AccountState currentState, AccountBloc bloc}) async* {
    try {
      yield AddressPickedState(address: address);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAccountEvent', error: _, stackTrace: stackTrace);
      yield ErrorAccountState(_?.toString());
    }
  }
}

class LoadHistoryEvent extends AccountEvent {
  final String addressId;
  LoadHistoryEvent({this.addressId});
  @override
  Stream<AccountState> applyAsync(
      {AccountState currentState, AccountBloc bloc}) async* {
    try {
      yield AccountLoadingState();
      final ApiResponse response = await AppApi().getBrowseHistory();
      if (response.status == APIStatus.COMPLETED) {
        final data = MOrder.fromJson({"items": response.data});
        yield HistoryDoneState(products: data.items);
      } else {
        yield ErrorAccountState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAccountEvent', error: _, stackTrace: stackTrace);
      yield ErrorAccountState(_?.toString());
    }
  }
}
