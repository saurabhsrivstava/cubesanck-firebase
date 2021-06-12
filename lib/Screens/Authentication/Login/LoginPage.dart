import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/Login/Bloc/Login_bloc.dart';
import 'package:cubesnack/Screens/Authentication/Login/Views/LoginTitle.dart';
import 'package:cubesnack/Screens/Authentication/Login/Views/OrDivider.dart';
import 'package:cubesnack/Screens/Authentication/Login/Views/SigninForm.dart';
import 'package:cubesnack/Screens/Authentication/Login/Views/SocialActions.dart';
import 'package:cubesnack/Screens/Authentication/Signup/SignupPage.dart';
import 'package:cubesnack/Screens/Notifications/Manager/NotificationManager.dart';
import 'package:cubesnack/Tabbar/AppTabbar.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/WebBuilder/WebBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _bloc;
  final email = TextEditingController(text: UserSession.shared.email);
  final password = TextEditingController(text: UserSession.shared.password);

  @override
  void initState() {
    _bloc = LoginBloc(UnLoginState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "login",
        ),
        body: BlocProvider(
          create: (context) => _bloc,
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
                            LoginTitle(title: "hello", details: "youCanUse"),
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              child: Column(
                                children: <Widget>[
                                  SigninForm(
                                    email: email,
                                    password: password,
                                  ),
                                  OrDivider(),
                                  SocialActions(),
                                  AppTitle(
                                    title: "dontHaveAccount",
                                    fontSize: AppFont.title2,
                                    isLocalised: true,
                                    color: AppColors.grey700,
                                  ),
                                  AppRoundButton(
                                    title: "createAccount",
                                    isBorder: true,
                                    backgroundColor: Colors.white,
                                    borderColor: AppColors.greyBorder,
                                    height: 30,
                                    width: 150,
                                    titleColor: AppColors.darkBlue,
                                    isRightIcon: false,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    onPressed: () =>
                                        this._showSignupPage(context),
                                    margin: 20,
                                  )
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
            listener: (context, state) {
              if (state is ErrorLoginState) {
                AppAlert.showAlert(
                    title: "error",
                    isLocalised: true,
                    message: state.errorMessage,
                    context: context);
              } else if (state is LoginDoneState) {
                NotificationManager.shared.registerForFCM(context);
                _showHomePage(context);
              }
            },
            cubit: _bloc,
          ),
        ));
  }

  _showSignupPage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignupPage(
                  bloc: _bloc,
                )));
  }

  _showHomePage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AppTabbar()),
        (Route<dynamic> route) => false);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    _bloc.close();
    super.dispose();
  }
}
