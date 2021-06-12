import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Screens/Authentication/ForgotPassword/Views/ForgotPasswordBuilder.dart';
import 'package:cubesnack/Screens/Authentication/Login/Bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final LoginBloc _bloc = LoginBloc(UnLoginState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => _bloc,
          child: BlocConsumer(
            builder: (context, state) {
              return Stack(
                children: [
                  ForgotPasswordBuilder(),
                  if (state is LoginLoadingState) AppLoader()
                ],
              );
            },
            cubit: _bloc,
            listener: (context, state) {
              if (state is LoginDoneState) {}
            },
          ),
        ));
  }
}
