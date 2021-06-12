import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Views/SellerBusinessInfoBuilder.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerBusinessInfoPage extends StatefulWidget {
  final PageMode status;
  const SellerBusinessInfoPage({Key key, this.status = PageMode.view})
      : super(key: key);

  @override
  _SellerBusinessInfoPageState createState() => _SellerBusinessInfoPageState();
}

class _SellerBusinessInfoPageState extends State<SellerBusinessInfoPage> {
  SellerSignupBloc bloc;

  @override
  void initState() {
    bloc = SellerSignupBloc(SellerSignupDefaultState());
    if (this.widget.status == PageMode.edit) {
      bloc.add(GetBusinessInfoEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer(
        builder: (context, state) {
          BusinessInfo data;
          if (state is SellerSignupDoneState) {
            data = state.data;
            return SellerBusinessInfoBuilder(
              data: data,
            );
          }
          return Stack(
            children: [
              SellerBusinessInfoBuilder(
                data: data,
              ),
              if (state is SellerSignupLoadingState) AppLoader()
            ],
          );
        },
        listener: (context, state) {
          if (state is SellerSignupDoneState &&
              this.widget.status == PageMode.view) {
            SellerSignupParent.of(context)
                .data
                .stepCallBack(SellerSignupSteps.storeInfo);
          }
          if (state is SellerSignupErrorState) {
            AppAlert.showAlert(
                context: context, title: "error", message: state.errorMessage);
          }
        },
        cubit: bloc,
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
