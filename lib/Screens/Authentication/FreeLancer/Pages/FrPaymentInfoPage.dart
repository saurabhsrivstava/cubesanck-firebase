import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MPaymentInfo.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Views/FrPaymentInfoView.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/PaymentInfo/SellerPaymentInfoPage.dart';
import 'package:cubesnack/Screens/Payments/Screens/CardList/Pages/CardListPage.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import 'FrSignupParentPage.dart';

class FrPaymentInfoPage extends StatelessWidget {
  const FrPaymentInfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: CardListPage(
        isNew: true,
        isNavBar: false,
        callBack: () {
          FrSignupParentPage.of(context)
              .data
              .stepCallBack(FrSignupSteps.accountSecurity);
        },
      ),
    );
  }
}

// class FrPaymentInfoPage extends StatefulWidget {
//   const FrPaymentInfoPage({Key key}) : super(key: key);

//   @override
//   _FrPaymentInfoPageState createState() => _FrPaymentInfoPageState();
// }

// class _FrPaymentInfoPageState extends State<FrPaymentInfoPage> {
//   FreeLancerBloc bloc;

//   @override
//   void initState() {
//     super.initState();
//     bloc = FreeLancerBloc(FreeLancerDefaultState());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: BlocConsumer(
//         builder: (context, state) {
//           if (state is FreeLancerLoadingState) return AppLoader();
//           return FrPaymentInfoView(
//             callBack: _nextPressed,
//             verifyPhonePresse: _verifyPhonePresse,
//             info: info,
//           );
//         },
//         listener: (context, state) {
//           if (state is FreeLancerDoneState) {
//             FrSignupParentPage.of(context)
//                 .data
//                 .stepCallBack(FrSignupSteps.accountSecurity);
//           }

//           if (state is ErrorFreeLancerState) {
//             AppAlert.showAlert(
//                 context: context, title: "error", message: state.errorMessage);
//           }
//         },
//         cubit: bloc,
//       ),
//     );
//   }

//   _verifyPhonePresse() {}

//   _nextPressed() {
//     final error = info.validate();
//     if (error != null) {
//       Toast.show(error, context, gravity: 1);
//       return;
//     }
//     bloc.add(UpdateFreeLancerEvent(body: info.toJson()));
//   }

//   @override
//   void dispose() {
//     bloc.close();
//     super.dispose();
//   }
// }
