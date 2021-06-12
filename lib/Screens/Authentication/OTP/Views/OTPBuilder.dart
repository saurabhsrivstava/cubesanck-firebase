import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/Login/Bloc/index.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Localisation.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPBuilder extends StatelessWidget {
  final List<TextEditingController> controllers;
  const OTPBuilder({Key key, this.controllers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          appPrint("Dismiss keys");
        },
        child: Container(
          // color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: Card(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      AppTitle(
                        title: "Verification",
                        fontSize: AppFont.header,
                        fontWeight: AppFont.extraBold,
                        padding: EdgeInsets.only(top: 40),
                        color: AppColors.grey700,
                      ),
                      AppTitle(
                        title: "verificationCode",
                        fontSize: AppFont.title1,
                        maxLines: 2,
                        padding: EdgeInsets.all(10),
                        isLocalised: true,
                      ),
                      Container(
                        margin: EdgeInsets.all(30),
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OTPDigitTextFieldBox(
                              first: true,
                              last: false,
                              controller: controllers[0],
                            ),
                            OTPDigitTextFieldBox(
                              first: false,
                              last: false,
                              controller: controllers[1],
                            ),
                            OTPDigitTextFieldBox(
                              first: false,
                              last: false,
                              controller: controllers[2],
                            ),
                            OTPDigitTextFieldBox(
                              first: false,
                              last: false,
                              controller: controllers[3],
                            ),
                            OTPDigitTextFieldBox(
                              first: false,
                              last: false,
                              controller: controllers[4],
                            ),
                            OTPDigitTextFieldBox(
                              first: false,
                              last: true,
                              controller: controllers[5],
                            ),
                          ],
                        ),
                      ),
                      AppRoundButton(
                        title: "submit",
                        backgroundColor: AppColors.darkBlue,
                        margin: 40,
                        onPressed: () => this._nextPressed(context),
                      ),
                      AppTitle(
                        title: "didNotRecieveCode",
                        fontSize: AppFont.title2,
                        isLocalised: true,
                        color: AppColors.grey700,
                      ),
                      AppRoundButton(
                        title: "resend",
                        isBorder: true,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.greyBorder,
                        height: 30,
                        width: 150,
                        titleColor: AppColors.darkBlue,
                        isRightIcon: false,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        margin: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _nextPressed(context) {
    final otp = controllers.map((e) => e.text).join();
    if (otp.length < 6) {
      AppAlert.showAlert(
          context: context,
          title: "error",
          message: "Please enter the  valid otp");
      return;
    }

    BlocProvider.of<LoginBloc>(context).add(ValidateOTPEvent(otp: otp));
  }
}

class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  final TextEditingController controller;
  const OTPDigitTextFieldBox(
      {Key key, @required this.first, @required this.last, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 35,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Center(
          child: TextField(
            autofocus: true,
            controller: controller,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: true,
            readOnly: false,
            textAlign: TextAlign.center,
            // style: MyStyles.inputTextStyle,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              fillColor: AppColors.grey100,

              filled: true,
              counterText: "",
              contentPadding: EdgeInsets.all(0),
              // counter: Offstage(
              //   child: Container(),
              // ),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.2, color: AppColors.greyBorder),
                  borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.2, color: AppColors.greyBorder),
                  borderRadius: BorderRadius.circular(5)),
              hintText: "_",
              hintStyle: TextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
