import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MProductDetail.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MPromoteListing.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MShipping.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MTAC.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Models/MProductDetailVariant.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Models/MVariationResponse.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:meta/meta.dart';
import 'index.dart';

@immutable
abstract class AddListingEvent {
  Stream<AddListingState> applyAsync(
      {AddListingState currentState, AddListingBloc bloc});
}

class UnAddListingEvent extends AddListingEvent {
  @override
  Stream<AddListingState> applyAsync(
      {AddListingState currentState, AddListingBloc bloc}) async* {
    yield ListingDefaultState();
  }
}

class LoadCategoryEvent extends AddListingEvent {
  @override
  Stream<AddListingState> applyAsync(
      {AddListingState currentState, AddListingBloc bloc}) async* {
    try {
      yield ListingLoadingState();
      final ApiResponse response = await AppApi().getAllCategories();
      if (response.status == APIStatus.COMPLETED) {
        final res = MCategoryResponse.fromJson(response.data);
        yield CategoryDoneState(categories: res);
      } else {
        yield ErrorAddListingState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAddListingEvent', error: _, stackTrace: stackTrace);
      yield ErrorAddListingState(_?.toString());
    }
  }
}

class CreateProductEvent extends AddListingEvent {
  final MProductDetail product;
  CreateProductEvent({this.product});
  @override
  Stream<AddListingState> applyAsync(
      {AddListingState currentState, AddListingBloc bloc}) async* {
    try {
      yield ListingLoadingState();
      final body = product.toJson();
      final ApiResponse response = await AppApi().createProduct(body: body);
      if (response.status == APIStatus.COMPLETED) {
        final id = response.data["id"];
        yield ListingDoneState(id);
      } else {
        yield ErrorAddListingState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAddListingEvent', error: _, stackTrace: stackTrace);
      yield ErrorAddListingState(_?.toString());
    }
  }
}

class FetchVariationEvent extends AddListingEvent {
  final String categoryId;
  FetchVariationEvent({this.categoryId});
  @override
  Stream<AddListingState> applyAsync(
      {AddListingState currentState, AddListingBloc bloc}) async* {
    try {
      yield ListingLoadingState();
      final ApiResponse response =
          await AppApi().getAllVariations(categoryId: categoryId);
      if (response.status == APIStatus.COMPLETED) {
        final data = MVariationResponse.fromJson(response.data);
        yield VariationDoneState(response: data);
      } else {
        yield ErrorAddListingState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAddListingEvent', error: _, stackTrace: stackTrace);
      yield ErrorAddListingState(_?.toString());
    }
  }
}

class AddVariationEvent extends AddListingEvent {
  final MProductDetailVariant variant;
  final String productId;
  AddVariationEvent({this.variant, this.productId});
  @override
  Stream<AddListingState> applyAsync(
      {AddListingState currentState, AddListingBloc bloc}) async* {
    try {
      yield ListingLoadingState();
      final body = variant.toJson();
      final ApiResponse response =
          await AppApi().addProductVariants(body: body, productId: productId);
      if (response.status == APIStatus.COMPLETED) {
        yield CreateProductVariantDoneState();
      } else {
        yield ErrorAddListingState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAddListingEvent', error: _, stackTrace: stackTrace);
      yield ErrorAddListingState(_?.toString());
    }
  }
}

class AddShippingEvent extends AddListingEvent {
  final MShipping shipping;
  final String productId;
  AddShippingEvent({this.shipping, this.productId});
  @override
  Stream<AddListingState> applyAsync(
      {AddListingState currentState, AddListingBloc bloc}) async* {
    try {
      yield ListingLoadingState();
      final body = shipping.toJson();
      final ApiResponse response =
          await AppApi().addShippinng(body: body, productId: productId);
      if (response.status == APIStatus.COMPLETED) {
        yield ListingDoneState("");
      } else {
        yield ErrorAddListingState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAddListingEvent', error: _, stackTrace: stackTrace);
      yield ErrorAddListingState(_?.toString());
    }
  }
}

class AddTandEvent extends AddListingEvent {
  final MTAC tandc;
  final String productId;
  AddTandEvent({this.tandc, this.productId});
  @override
  Stream<AddListingState> applyAsync(
      {AddListingState currentState, AddListingBloc bloc}) async* {
    try {
      yield ListingLoadingState();
      final body = tandc.toJson();
      final ApiResponse response =
          await AppApi().addTandC(body: body, productId: productId);
      if (response.status == APIStatus.COMPLETED) {
        yield ListingDoneState("");
      } else {
        yield ErrorAddListingState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAddListingEvent', error: _, stackTrace: stackTrace);
      yield ErrorAddListingState(_?.toString());
    }
  }
}

class AddPromoteEvent extends AddListingEvent {
  final MPromoteListing listing;
  final String productId;
  AddPromoteEvent({this.listing, this.productId});
  @override
  Stream<AddListingState> applyAsync(
      {AddListingState currentState, AddListingBloc bloc}) async* {
    try {
      yield ListingLoadingState();
      final body = listing.toJson();
      final ApiResponse response =
          await AppApi().promoteListing(body: body, productId: productId);
      if (response.status == APIStatus.COMPLETED) {
        yield ListingDoneState("");
      } else {
        yield ErrorAddListingState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAddListingEvent', error: _, stackTrace: stackTrace);
      yield ErrorAddListingState(_?.toString());
    }
  }
}
