import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/AllStores/Views/AllStoresGridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllStoresGridPage extends StatefulWidget {
  const AllStoresGridPage({Key key}) : super(key: key);

  @override
  _AllStoresGridPageState createState() => _AllStoresGridPageState();
}

class _AllStoresGridPageState extends State<AllStoresGridPage> {
  SellerSignupBloc bloc;

  @override
  void initState() {
    bloc = SellerSignupBloc(SellerSignupDefaultState());
    bloc.add(GetAllStoreEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "stores",
          isCart: true,
        ),
        body: BlocConsumer(
          builder: (context, state) {
            List<MStore> stores;
            if (state is SellerSignupLoadingState) {
              return AppLoader();
            }
            if (state is StoreLoadingDoneState) {
              stores = state.store;
            }
            return AllStoresGridView(
              stores: stores,
            );
          },
          listener: (context, state) {},
          cubit: bloc,
        ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
