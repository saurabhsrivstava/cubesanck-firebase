import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:flutter/material.dart';

class SideMenuRow extends StatelessWidget {
  final String title;
  final Function callBack;
  final IconData icon;
  const SideMenuRow({Key key, this.title = '', this.callBack, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.callBack(context),
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon),
                  SizedBox(width: 10),
                  AppTitle(
                    title: title,
                    isLocalised: true,
                  )
                ],
              ),
              Divider(
                thickness: 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
