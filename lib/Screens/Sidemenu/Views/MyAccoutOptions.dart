import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';

class MyAccountOptions extends StatelessWidget {
  final Function account;

  const MyAccountOptions({Key key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    child: Image.asset(
                      "assets/images/profile_image.png",
                      fit: BoxFit.fill,
                      width: 100,
                      height: 100,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AppTitle(
                        title: "Welcome,",
                        fontWeight: FontWeight.w500,
                        fontSize: AppFont.header,
                      ),
                      AppTitle(
                        title: UserSession.shared.getUserName() ?? "",
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                        fontSize: AppFont.title3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 35,
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: AppTitle(
                title: "MY ACCOUNT",
                fontWeight: FontWeight.w600,
                fontSize: AppFont.header,
              ),
            ),
            ..._getOptios()
          ],
        ),
      ),
    );
  }

  _getOptios() {
    List<Widget> options = [];
    MyAccount.values
        .map((MyAccount e) => options.add(OptionRow(
      title: e.title(),
      icon: e.icon(),
      showDetails: this._showDetails,
      type: e,
    )))
        .toList();
    return options;
  }

  _showDetails(MyAccount type, context) {
    if (PlatformInfo.isDesktop(context)) {
      this.account(type);
    } else {
      type.showDetails(context);
    }
  }
}

class OptionRow extends StatelessWidget {
  final String title;
  final bool isEdit;
  final Icon icon;
  final Function showDetails;
  final dynamic type;

  const OptionRow(
      {Key key,
        this.title,
        this.isEdit = false,
        this.icon,
        this.showDetails,
        this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () => this.showDetails(this.type, context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            SizedBox(width: 10),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTitle(
                      title: title,
                      fontSize: AppFont.title3,
                    ),
                    Divider()
                  ],
                )),
            isEdit ? Icon(Icons.portable_wifi_off) : Container()
          ],
        ),
      ),
    );
  }
}
