import 'package:cubesnack/Screens/Authentication/Login/Bloc/index.dart';
import 'package:cubesnack/WebBuilder/WebBuilder.dart';
import 'package:flutter/material.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Localisation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordBuilder extends StatelessWidget {
  const ForgotPasswordBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = ;
    return WebBuilder(
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 250,
                width: 250,
                child: SvgPicture.asset("assets/signup/forget-password.svg"),
              ),
              Card(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 50),
                  child: Column(
                    children: <Widget>[
                      AppTitle(
                        title: "forgotYourPassword",
                        fontWeight: FontWeight.w700,
                        fontSize: AppFont.header,
                        isLocalised: true,
                        color: AppColors.grey700,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppTitle(
                        title: "forgotPass",
                        fontSize: AppFont.title2,
                        isLocalised: true,
                        maxLines: 3,
                      ),
                      AppTitleTextField(
                        title: AppLocalizations.of(context)
                            .translate("emailAddress"),
                        marginTop: 20,
                      ),
                      AppRoundButton(
                        margin: 20,
                        title: "send",
                        onPressed: () => BlocProvider.of<LoginBloc>(context)
                            .add(EmailSentEvent(email: "")),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
