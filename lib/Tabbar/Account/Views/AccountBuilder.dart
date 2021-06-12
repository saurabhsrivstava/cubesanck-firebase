import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Sidemenu/Views/AboutApp.dart';
import 'package:cubesnack/Screens/Sidemenu/Views/MyAccoutOptions.dart';
import 'package:cubesnack/Screens/Sidemenu/Views/VenderManagement.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/TokenManager.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';

class AccountBuilder extends StatefulWidget {
  final Function account;
  final Function vender;

  const AccountBuilder({this.account, this.vender, Key key}) : super(key: key);

  @override
  _AccountBuilderState createState() => _AccountBuilderState();
}

class _AccountBuilderState extends State<AccountBuilder> {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = UserSession.shared.isLoggedIn();
    return Container(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (isLoggedIn) AfterLoginHeader(),
              if (isLoggedIn) MyAccountOptions(account: this._accountCall),
              UserSession.shared.role == UserRoles.seller
                  ? VenderManagement(
                vender: _venderCall,
              )
                  : Container(),
              AboutApp(),
              if (isLoggedIn)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppRoundButton(
                      title: "logout",
                      isBorder: true,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.greyBorder,
                      titleColor: AppColors.grey700,
                      isRightIcon: false,
                      height: 30,
                      onPressed: () {
                        TokenManager.resetPreference();
                        this.setState(() {});
                      },
                    ),
                  ],
                ),
              SizedBox(height: 50)
            ],
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 40),
    );
  }

  _accountCall(MyAccount account) {
    widget.account(account);
  }

  _venderCall(VenderManagementEnum e) {
    widget.vender(e);
  }
}
