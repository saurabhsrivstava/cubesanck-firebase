import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/TaxInfo/Views/SellerTaxInfoBuilder.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:cubesnack/Utils/TokenManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerTaxInfoPage extends StatefulWidget {
  const SellerTaxInfoPage({Key key}) : super(key: key);

  @override
  _SellerTaxInfoPageState createState() => _SellerTaxInfoPageState();
}

class _SellerTaxInfoPageState extends State<SellerTaxInfoPage> {
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
          cubit: bloc,
          builder: (context, state) {
            return Stack(
              children: [
                SellerTaxInfoBuilder(),
                if (state is SellerSignupLoadingState) AppLoader(),
              ],
            );
          },
          listener: (context, state) {
            if (state is SellerSignupDoneState) {
              TokenManager.resetLastSeller();
              SellerSignupParent.of(context)
                  .data
                  .stepCallBack(SellerSignupSteps.paymentInfo);
            }
            if (state is SellerSignupErrorState) {
              AppAlert.showAlert(
                  context: context,
                  title: "error",
                  message: state.errorMessage);
            }
          }),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
