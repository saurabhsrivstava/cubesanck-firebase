import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/ForgotPassword/ForgotPasswordPage.dart';
import 'package:cubesnack/Screens/Authentication/Login/Bloc/index.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/TokenManager.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninForm extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;

  const SigninForm({Key key, this.email, this.password}) : super(key: key);

  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  bool isSave = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          AppTextField(
            topMargin: 15,
            labelText: "Email",
            hintText: "Email",
            controller: widget.email,
            keyBoardType: TextInputType.emailAddress,
            rightIcon: Icon(
              Icons.email,
              color: AppColors.greyBorder,
            ),
          ),
          AppTextField(
            topMargin: 10,
            labelText: "Email",
            hintText: "Password",
            controller: widget.password,
            obscureText: true,
            rightIcon: Icon(
              Icons.lock,
              color: AppColors.greyBorder,
            ),
          ),
          Row(
            children: <Widget>[
              RememberSwitch(email: widget.email.text, password: widget.password.text,valueCallBack:(v){
                  isSave = v;
              },),
              Spacer(),
              InkWell(
                child: AppTitle(
                  color: AppColors.darkBlue,
                  title: "Forgot password?",
                  fontSize: AppFont.title2,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()));
                },
              ),
            ],
          ),
          AppRoundButton(
            title: "login",
            height: 40,
            width: 150,
            onPressed: () => {
              if(isSave){
                TokenManager.setLoginCred(email:widget.email.text, password: widget.password.text)
              },
              BlocProvider.of<LoginBloc>(context).add(
                EmailLoginEvent(email: widget.email.text, password: widget.password.text))},
          )
        ],
      ),
    );
  }
}

class RememberSwitch extends StatefulWidget {
  final String email;
  final String password;
  final Function valueCallBack ;

  RememberSwitch({this.email, this.password, this.valueCallBack});
  @override
  _RememberSwitchState createState() => _RememberSwitchState();
}

class _RememberSwitchState extends State<RememberSwitch> {

  bool value = false;
  
  @override
  void initState() { 
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Switch(
          value: value,
          onChanged: (v) {
            this.setState(() {
                value = v;
                widget.valueCallBack(v);
              });
          },
        ),
        AppTitle(
          title: "Remember me",
          fontSize: AppFont.title2,
          color: AppColors.grey700,
        )
      ],
    );
  }
}
