import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/Login/Bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController fullName;

  const SignupForm({Key key, this.email, this.password, this.fullName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AppTextField(
            labelText: "Full Name",
            hintText: "Full Name",
            rightIcon: Icon(Icons.account_box),
            topMargin: 5,
            controller: fullName,
          ),
          AppTextField(
            labelText: "Email",
            hintText: "Email",
            rightIcon: Icon(Icons.email),
            topMargin: 10,
            keyBoardType: TextInputType.emailAddress,
            controller: email,
          ),
          AppTextField(
            labelText: "Email",
            hintText: "Password",
            rightIcon: Icon(Icons.lock),
            topMargin: 10,
            controller: password,
            obscureText: true,
          ),
          AppRoundButton(
            margin: 20,
            title: "continue",
            height: 40,
            width: 150,
            onPressed: () => this._signupPressed(context),
          )
        ],
      ),
    );
  }

  _signupPressed(context) {
    if (email.text.length < 1 ||
        password.text.length < 1 ||
        fullName.text.length < 1) {
      AppAlert.showAlert(
          context: context,
          title: "error",
          message: "All fields are mandatory.");
      return;
    }
    BlocProvider.of<LoginBloc>(context).add(SignupEvent(
        email: email.text,
        password: password.text,
        fullName: this.fullName.text));
  }
}
