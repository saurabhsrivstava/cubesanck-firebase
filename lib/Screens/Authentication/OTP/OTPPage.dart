import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/Login/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/OTP/Views/OTPBuilder.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key key}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final digit1 = TextEditingController();
  final digit2 = TextEditingController();
  final digit3 = TextEditingController();
  final digit4 = TextEditingController();
  final digit5 = TextEditingController();
  final digit6 = TextEditingController();
  final LoginBloc bloc = LoginBloc(UnLoginState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "otp",
        ),
        body: BlocProvider(
          create: (context) => bloc,
          child: BlocConsumer(
            builder: (context, state) {
              return Stack(
                children: [
                  OTPBuilder(
                    controllers: [
                      digit1,
                      digit2,
                      digit3,
                      digit4,
                      digit5,
                      digit6
                    ],
                  ),
                  if (state is LoginLoadingState) AppLoader()
                ],
              );
            },
            listener: (context, state) {
              if (state is LoginDoneState) {
                Navigator.of(context).popUntil((route) => route.isFirst);
                //Navigator.popUntil(context, ModalRoute.withName("/"));
              }
              if (state is ErrorLoginState) {
                AppAlert.showAlert(
                    context: context,
                    title: "error",
                    message: state.errorMessage);
              }
            },
            cubit: bloc,
          ),
        ));
  }

  @override
  void dispose() {
    digit1.dispose();
    digit2.dispose();
    digit3.dispose();
    digit4.dispose();
    digit5.dispose();
    digit6.dispose();
    bloc.close();
    super.dispose();
  }
}
