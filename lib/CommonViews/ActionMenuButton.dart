import 'package:cubesnack/Screens/Authentication/Login/LoginPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionMenuButton extends StatelessWidget {
  final String text;

  const ActionMenuButton({Key key, this.text})
      : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.only(left: 10, right: 10),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        shadowColor: Colors.grey,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: SizedBox(
            width: 140,
            height: 40,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: AppFont.regular,
                    fontFamily: AppFont.proximaNova,
                    fontSize: AppFont.title3,
                    color: Colors.blueAccent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
