import 'package:cubesnack/CommonViews/AppLoader.dart';

import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ViewEditStore/Views/SellerViewEditBuilder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerViewEditStore extends StatefulWidget {
  final PageMode status;
  final String title;
  final String id;
  const SellerViewEditStore(
      {Key key, this.title = '', this.status = PageMode.view, this.id})
      : super(key: key);

  @override
  _SellerViewEditStoreState createState() => _SellerViewEditStoreState();
}

class _SellerViewEditStoreState extends State<SellerViewEditStore> {
  MStore store;
  SellerSignupBloc bloc;

  @override
  void initState() {
    store = MStore.init();
    bloc = SellerSignupBloc(SellerSignupDefaultState());
    _loaStoreDetailData();
    super.initState();
  }

  _loaStoreDetailData() {
    if (this.widget.status == PageMode.edit && this.widget.id != null) {
      bloc.add(GetStoreDetailsEvent(id: this.widget.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer(
        builder: (context, state) {
          if (state is SellerSignupDoneState && state.store != null) {
            store = state.store;
            return SellerViewEditBuilder(
              store: store,
              status: widget.status,
            );
          }
          return Stack(
            children: [
              SellerViewEditBuilder(store: store, status: widget.status),
              if (state is SellerSignupLoadingState) AppLoader()
            ],
          );
        },
        cubit: bloc,
        listener: (context, state) {
          if (state is SellerSignupErrorState) {
            AppAlert.showAlert(
                context: context, title: "error", message: state.errorMessage);
          }
          if (state is SellerSignupDoneState &&
              this.widget.status == PageMode.view) {
            SellerSignupParent.of(context)
                .data
                .stepCallBack(SellerSignupSteps.taxesInfo);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
