import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MFrPersonalInfo.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Views/FrPersonalInfoView.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'FrSignupParentPage.dart';

class FrPersonalInfoPage extends StatefulWidget {
  const FrPersonalInfoPage({Key key}) : super(key: key);

  @override
  _FrPersonaInfoPageState createState() => _FrPersonaInfoPageState();
}

class _FrPersonaInfoPageState extends State<FrPersonalInfoPage> {
  MFrPersonalInfo personalInfo;
  FreeLancerBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = FreeLancerBloc(FreeLancerDefaultState());
    personalInfo = MFrPersonalInfo();
    personalInfo.firstName = UserSession.shared.getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer(
        builder: (context, state) {
          return Stack(
            children: [
              FrPersonalInfoView(
                personalInfo: personalInfo,
              ),
              if (state is FreeLancerLoadingState) AppLoader()
            ],
          );
        },
        listener: (context, state) {
          if (state is FreeLancerDoneState) {
            FrSignupParentPage.of(context)
                .data
                .stepCallBack(FrSignupSteps.professionalInfo);
          }

          if (state is ErrorFreeLancerState) {
            AppAlert.showAlert(
                context: context, title: "error", message: state.errorMessage);
          }
        },
        cubit: bloc,
      ),
    );
  }

  _nextPressed(context) {
    FrSignupParentPage.of(context).data.stepCallBack();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
