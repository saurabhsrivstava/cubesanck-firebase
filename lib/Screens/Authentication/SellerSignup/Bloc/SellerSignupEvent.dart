import 'dart:async';
import 'dart:developer' as developer;
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/AllStores/Models/MAllStoreResponse.dart';
import 'package:cubesnack/Screens/Products/Models/MReturnResponse.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:meta/meta.dart';
import 'index.dart';

@immutable
abstract class SellerSignupEvent {
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc});
}

class UnPersonalInfoEvent extends SellerSignupEvent {
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    yield SellerSignupDefaultState();
  }
}

class AddPersonalInfoEvent extends SellerSignupEvent {
  final PersonalInfo personalInfo;
  AddPersonalInfoEvent({this.personalInfo});
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    try {
      final body = personalInfo.toJson();
      yield SellerSignupLoadingState();
      ApiResponse response = await AppApi().addSellerPersonalInfo(body);
      if (response.status == APIStatus.COMPLETED) {
        yield SellerSignupDoneState(id: response.data["id"]);
      } else {
        yield SellerSignupErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPersonalInfoEvent', error: _, stackTrace: stackTrace);
      yield SellerSignupErrorState(_?.toString());
    }
  }
}

class AddBusinessInfoEvent extends SellerSignupEvent {
  final BusinessInfo businessInfo;
  final String sellerId;
  AddBusinessInfoEvent({this.businessInfo, this.sellerId});
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    try {
      final body = businessInfo.toJson();
      yield SellerSignupLoadingState();
      ApiResponse response =
          await AppApi().addSellerBusinessInfo(body: body, sellerId: sellerId);
      if (response.status == APIStatus.COMPLETED) {
        UserSession.shared.setBusinessUnitId(response?.data["id"]);
        yield SellerSignupDoneState();
      } else {
        yield SellerSignupErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPersonalInfoEvent', error: _, stackTrace: stackTrace);
      yield SellerSignupErrorState(_?.toString());
    }
  }
}

class GetBusinessInfoEvent extends SellerSignupEvent {
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    try {
      yield SellerSignupLoadingState();
      ApiResponse response = await AppApi().getSellerBusinessInfo();
      if (response.status == APIStatus.COMPLETED) {
        final bInfo = BusinessInfo.fromJson(response.data);
        yield SellerSignupDoneState(data: bInfo);
      } else {
        yield SellerSignupErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPersonalInfoEvent', error: _, stackTrace: stackTrace);
      yield SellerSignupErrorState(_?.toString());
    }
  }
}

class AddTaxInfoEvent extends SellerSignupEvent {
  final TaxInfo taxInfo;
  final String sellerId;
  AddTaxInfoEvent({this.taxInfo, this.sellerId});
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    try {
      final body = taxInfo.toJson();
      yield SellerSignupLoadingState();
      ApiResponse response =
          await AppApi().addSellerTaxInfo(body: body, sellerId: sellerId);
      if (response.status == APIStatus.COMPLETED) {
        yield SellerSignupDoneState();
      } else {
        yield SellerSignupErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPersonalInfoEvent', error: _, stackTrace: stackTrace);
      yield SellerSignupErrorState(_?.toString());
    }
  }
}

class AddStoreEvent extends SellerSignupEvent {
  final MStore store;
  AddStoreEvent({this.store});
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    try {
      store.filterData();
      final body = store.toJson();
      yield SellerSignupLoadingState();

      ApiResponse response = await AppApi()
          .addStore(body: body, bId: UserSession.shared.getBusinessUnitId());
      if (response.status == APIStatus.COMPLETED) {
        yield SellerSignupDoneState();
      } else {
        yield SellerSignupErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPersonalInfoEvent', error: _, stackTrace: stackTrace);
      yield SellerSignupErrorState(_?.toString());
    }
  }
}

class GetStoreDetailsEvent extends SellerSignupEvent {
  final String id;
  GetStoreDetailsEvent({this.id});
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    try {
      yield SellerSignupLoadingState();
      ApiResponse response = await AppApi().getStoresDetails(id);
      if (response.status == APIStatus.COMPLETED) {
        final store = MStore.fromJson(response.data);
        appPrint(store);
        yield SellerSignupDoneState(store: store);
      } else {
        yield SellerSignupErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPersonalInfoEvent', error: _, stackTrace: stackTrace);
      yield SellerSignupErrorState(_?.toString());
    }
  }
}

class GetAllStoreEvent extends SellerSignupEvent {
  GetAllStoreEvent();
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    try {
      yield SellerSignupLoadingState();
      ApiResponse response = await AppApi().getAllStores();
      if (response.status == APIStatus.COMPLETED) {
        final data = MAllStoreResponse.fromJson({"allStores": response.data});
        yield StoreLoadingDoneState(store: data.allStores);
      } else {
        yield SellerSignupErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPersonalInfoEvent', error: _, stackTrace: stackTrace);
      yield SellerSignupErrorState(_?.toString());
    }
  }
}

class GetReturnDataEvent extends SellerSignupEvent {
  GetReturnDataEvent();
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    try {
      yield SellerSignupLoadingState();
      ApiResponse response = await AppApi().sellerReturnList();
      if (response.status == APIStatus.COMPLETED) {
        final data = MReturnResponse.fromJson({"items": response.data});
        yield FetchingReturnDoneState(items: data.items);
      } else {
        yield SellerSignupErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPersonalInfoEvent', error: _, stackTrace: stackTrace);
      yield SellerSignupErrorState(_?.toString());
    }
  }
}

class AuthrizeReturnEvent extends SellerSignupEvent {
  AuthrizeReturnEvent();
  @override
  Stream<SellerSignupState> applyAsync(
      {SellerSignupState currentState, SellerSignupBloc bloc}) async* {
    try {
      yield SellerSignupLoadingState();
      ApiResponse response = await AppApi().sellerReturnList();
      if (response.status == APIStatus.COMPLETED) {
        final data = MReturnResponse.fromJson({"items": response.data});
        yield FetchingReturnDoneState(items: data.items);
      } else {
        yield SellerSignupErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPersonalInfoEvent', error: _, stackTrace: stackTrace);
      yield SellerSignupErrorState(_?.toString());
    }
  }
}
