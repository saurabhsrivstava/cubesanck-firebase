import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/Bloc/Store_bloc.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ManageStore/Views/ManageStoreBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageStorePage extends StatefulWidget {
  const ManageStorePage({Key key}) : super(key: key);

  @override
  _ManageStorePageState createState() => _ManageStorePageState();
}

class _ManageStorePageState extends State<ManageStorePage> {
  StoreBloc bloc;

  @override
  void initState() {
    bloc = StoreBloc(StoreDefaultState());
    bloc.add(LoadStoreListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "manageStore",
        ),
        body: BlocConsumer(
          builder: (context, state) {
            List<MStore> stores;
            if (state is StoreLoadingState) return AppLoader();
            if (state is StoreDoneState) {
              stores = state.stores.store;
            }
            return ManageStoreBuilder(
              stores: stores,
            );
          },
          listener: (context, state) {
            if (state is ErrorStoreState) {
              AppAlert.showAlert(
                  context: context,
                  title: "Error",
                  message: state.errorMessage);
            }
          },
          cubit: bloc,
        ));
  }
}
