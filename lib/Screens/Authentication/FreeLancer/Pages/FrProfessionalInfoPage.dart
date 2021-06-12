import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MProfessionalInfo.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Views/FrProfessionalInfoView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import 'FrSignupParentPage.dart';

class FrProfessionalInfoPage extends StatefulWidget {
  const FrProfessionalInfoPage({Key key}) : super(key: key);

  @override
  _FrProfessionalInfoPageState createState() => _FrProfessionalInfoPageState();
}

class _FrProfessionalInfoPageState extends State<FrProfessionalInfoPage> {
  FreeLancerBloc bloc;
  MProfessionalInfo info;

  @override
  void initState() {
    super.initState();
    info = MProfessionalInfo.init();
    bloc = FreeLancerBloc(FreeLancerDefaultState());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        if (state is FreeLancerLoadingState) return AppLoader();

        return Container(
          child: FrProfessionalInfoView(
            info: info,
            submitPressed: _nextPressed,
          ),
        );
      },
      listener: (context, state) {
        if (state is ErrorFreeLancerState) {
          Toast.show(state.errorMessage, context, gravity: 1);
        }
        if (state is FreeLancerDoneState) {
          FrSignupParentPage.of(context)
              .data
              .stepCallBack(FrSignupSteps.paymentInfo);
        }
      },
      cubit: bloc,
    );
  }

  _nextPressed() {
    final error = info.validate();
    if (error != null) {
      Toast.show(error, context, gravity: 1);
      return;
    }
    bloc.add(UpdateFreeLancerEvent(body: info.toJson()));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
