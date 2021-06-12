import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/PersonalInfo/SellerPersonalInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Views/SellerAddress.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';

class SellerAddStorePage extends StatefulWidget {
  const SellerAddStorePage({Key key}) : super(key: key);

  @override
  _SellerAddStorePageState createState() => _SellerAddStorePageState();
}

class _SellerAddStorePageState extends State<SellerAddStorePage> {
  final TextEditingController fistNameCnt = TextEditingController();
  final TextEditingController lastNameCnt = TextEditingController();
  final TextEditingController emailCnt =
      TextEditingController(text: UserSession.shared.getemail());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Text(
                "Sign up".toUpperCase(),
                style: TextStyle(fontSize: 32),
              ),
              height: 45,
            ),
            AppTextField(
              hintText: "First Name",
              controller: fistNameCnt,
            ),
            AppTextField(
              hintText: "Last Name",
              controller: lastNameCnt,
            ),
            AppTextField(
              hintText: "Email",
              controller: emailCnt,
            ),
            Flexible(child: SellerAddress()),
            AppRoundButton(
              title: "continue",
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SellerPersonalInfoPage())),
            )
          ],
        ),
      ),
    );
  }
}
