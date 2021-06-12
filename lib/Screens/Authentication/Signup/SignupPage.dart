import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/Login/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/Login/Views/LoginTitle.dart';
import 'package:cubesnack/Screens/Authentication/Login/Views/OrDivider.dart';
import 'package:cubesnack/Screens/Authentication/Login/Views/SocialActions.dart';
import 'package:cubesnack/Screens/Notifications/Manager/NotificationManager.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/WebBuilder/WebBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import 'Views/SignupForm.dart';

class SignupPage extends StatefulWidget {
  final LoginBloc bloc;
  const SignupPage({Key key, this.bloc}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "signup",
        ),
        body: BlocProvider(
            create: (context) => widget.bloc,
            child: BlocConsumer(
              builder: (context, state) {
                return WebBuilder(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              LoginTitle(
                                title: "letsgetStarted",
                                details: "createAnAccount",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Card(
                                child: Column(
                                  children: <Widget>[
                                    SignupForm(
                                      email: email,
                                      password: password,
                                      fullName: fullName,
                                    ),
                                    OrDivider(),
                                    SocialActions()
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      (state is LoginLoadingState) ? AppLoader() : Container()
                    ],
                  ),
                );
              },
              cubit: widget.bloc,
              listener: (context, state) {
                if (state is LoginDoneState) {
                  Navigator.pushNamed(context, AppRoutes.otpScreen);
                  Toast.show("User created succesfully", context);
                  NotificationManager.shared.registerForFCM(context);
                } else if (state is ErrorLoginState) {
                  AppAlert.showAlert(
                      title: "error",
                      //isLocalised: true,
                      message: state.errorMessage,
                      context: context);
                }
              },
            )));
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    fullName.dispose();
    super.dispose();
  }
}
