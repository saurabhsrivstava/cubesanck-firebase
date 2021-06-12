import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppTitle.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final SocialType type;
  final Function onPress;
  const SocialButton({Key key, this.title, this.type, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = type.getData();
    return InkWell(
      onTap: () => this.onPress(),
      child: Container(
          decoration: BoxDecoration(
              color: type.getData().backgroundColor,
              borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          height: 35,
          padding: EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                data.icon,
                width: 20,
                height: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppTitle(
                      title: type.getData().name,
                      color: Colors.white,
                      fontSize: AppFont.title3,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
