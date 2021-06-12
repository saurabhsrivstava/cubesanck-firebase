import 'package:cubesnack/CommonViews/AppErrorView.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/ReturnInfo/Views/SellerReturnInfoBuilder.dart';
import 'package:cubesnack/Screens/Products/Models/MReturn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerReturnInfoPage extends StatefulWidget {
  SellerReturnInfoPage({Key key}) : super(key: key);

  @override
  _SellerReturnInfoPageState createState() => _SellerReturnInfoPageState();
}

class _SellerReturnInfoPageState extends State<SellerReturnInfoPage> {
  SellerSignupBloc bloc;
  List<MReturn> items;

  @override
  void initState() {
    super.initState();
    bloc = SellerSignupBloc(SellerSignupDefaultState());
    bloc.add(GetReturnDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "manageReturns",
        ),
        body: BlocConsumer(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SellerSignupLoadingState) return AppLoader();
            if (state is FetchingReturnDoneState) {
              items = state.items;
            }
            if (state is SellerSignupErrorState) {
              return AppErrorView(
                callBack: () {
                  bloc.add(GetReturnDataEvent());
                },
                error: state.errorMessage,
              );
            }
            return SellerReturnInfoBuilder(
              items: items,
            );
          },
          cubit: bloc,
        ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
