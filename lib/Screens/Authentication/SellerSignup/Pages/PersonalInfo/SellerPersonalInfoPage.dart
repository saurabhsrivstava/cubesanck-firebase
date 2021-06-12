import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/PersonalInfo/Views/SellerPersonalInfoBuilder.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../SellerSignupPage.dart';

class SellerPersonalInfoPage extends StatefulWidget {
  const SellerPersonalInfoPage({Key key}) : super(key: key);

  @override
  _SellerPersonalInfoPageState createState() => _SellerPersonalInfoPageState();
}

class _SellerPersonalInfoPageState extends State<SellerPersonalInfoPage> {
  SellerSignupBloc bloc;

  @override
  void initState() {
    bloc = SellerSignupBloc(SellerSignupDefaultState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer(
        builder: (context, state) {
          return Stack(
            children: [
              SellerPersonalInfoBuilder(),
              if (state is SellerSignupLoadingState) AppLoader()
            ],
          );
        },
        listener: (context, state) {
          if (state is SellerSignupDoneState) {
            SellerSignupParent.of(context).data.sellerId = state.id;
            UserSession.shared.lastSellerId = state.id;
            SellerSignupParent.of(context)
                .data
                .stepCallBack(SellerSignupSteps.businessInfo);
          } else if (state is SellerSignupErrorState) {
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
