import 'package:cubesnack/CommonViews/AppCalendarButton.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/BrowseFilePreview.dart';
import 'package:cubesnack/CommonViews/DocumentPicker.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Views/SellerAddress.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../SellerSignupPage.dart';

class SellerPersonalInfoBuilder extends StatefulWidget {
  const SellerPersonalInfoBuilder({Key key}) : super(key: key);

  @override
  _SellerPersonalInfoBuilderState createState() =>
      _SellerPersonalInfoBuilderState();
}

class _SellerPersonalInfoBuilderState extends State<SellerPersonalInfoBuilder> {
  final pesonalInfo = PersonalInfo.init();

  @override
  void initState() {
    super.initState();
    pesonalInfo.email = UserSession.shared.getemail();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: () {
            appPrint("Dismiss keyboad");
          },
          child: Container(
            color: Colors.white,
            width: constraints.maxWidth < 500 ? size.width : 700,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppTextField(
                  topMargin: 5,
                  hintText: "firstName",
                  onChange: (v) {
                    pesonalInfo.firstName = v;
                  },
                  isLocalise: true,
                ),
                AppTextField(
                  topMargin: 10,
                  hintText: "lastName",
                  onChange: (v) {
                    pesonalInfo.lastName = v;
                  },
                  isLocalise: true,
                ),
                AppTextField(
                  topMargin: 10,
                  hintText: "email",
                  onChange: (v) {
                    pesonalInfo.email = v;
                  },
                  isLocalise: true,
                  value: UserSession.shared.getemail(),
                  keyBoardType: TextInputType.emailAddress,
                ),
                AppCalendarButton(
                  callBack: (date, v) {
                    pesonalInfo.dob = date;
                  },
                  title: "DOB",
                ),
                Flexible(
                    child: SellerAddress(
                  title: "address",
                  address: pesonalInfo.address,
                )),
                Column(
                  children: <Widget>[
                    MultiTitle(
                        top: 15,
                        title: AppTitle(
                          title: "phtoId",
                          fontSize: AppFont.title2,
                          isLocalised: true,
                          fontWeight: AppFont.semiBold,
                        ),
                        subTitle: AppTitle(
                          title: "driverLicence",
                          fontSize: AppFont.title1,
                          isLocalised: true,
                        )),
                    BrowseFilePreview(
                      valueCallBack: (ids) {
                        pesonalInfo.photoIdPath = ids;
                      },
                    ),
                  ],
                ),
                AppRoundButton(
                    margin: 20,
                    width: 180,
                    title: "continue",
                    onPressed: () => this._continuePress(context))
              ],
            ),
          ),
        );
      },
    );
  }

  _continuePress(context) {
    final error = pesonalInfo.validate();
    if (error == null) {
      BlocProvider.of<SellerSignupBloc>(context)
          .add(AddPersonalInfoEvent(personalInfo: pesonalInfo));
    } else {
      AppAlert.showAlert(
          title: "error", context: context, message: error, isLocalised: true);
    }
  }
}
