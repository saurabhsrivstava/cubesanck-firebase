import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppVerticleDivider.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class SellerIntroPage extends StatelessWidget {
  const SellerIntroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "",
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                    //color: Colors.red,
                    ),
                // flex: 1,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 0.1),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppTitle(
                        title:
                            "Getting started on Cubesnack is easier that ever!",
                        color: AppColors.darkBlue,
                        fontSize: AppFont.header,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                      AppTitle(
                        title:
                            "3 Easy steps and you will be on your way to a successful business",
                        fontSize: AppFont.title3,
                        maxLines: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _TitleRow(
                            icon: Icons.assignment,
                            title:
                                "Sign up with your basic information about yourself",
                          ),
                          AppVerticleDivider(
                            leftMargin: 12,
                          ),
                          _TitleRow(
                            icon: Icons.post_add,
                            title:
                                "Fill out a form with your business information",
                          ),
                          AppVerticleDivider(
                            leftMargin: 12,
                          ),
                          _TitleRow(
                            icon: Icons.account_balance,
                            title: "Link your bank and payment information",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // flex: 1,
              ),
              AppRoundButton(
                title: "getStarted",
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SellerSignupParent(
                              child: SellerSignupPage(),
                              data: SignupData(),
                            ))),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  final String title;
  final IconData icon;
  const _TitleRow({Key key, @required this.title, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(icon),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: AppTitle(
            title: title,
            fontSize: AppFont.title3,
          ),
        ),
      ],
    );
  }
}
