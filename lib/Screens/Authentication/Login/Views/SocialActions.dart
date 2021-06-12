import 'package:cubesnack/CommonViews/SocialButton.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/Login/Bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialActions extends StatelessWidget {
  const SocialActions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          // SocialButton(
          //   type: SocialType.apple,
          //   onPress: () => BlocProvider.of<LoginBloc>(context)
          //       .add(SocialLoginEvent(type: SocialType.apple)),
          // ),
          SocialButton(
            type: SocialType.gmail,
            onPress: () => BlocProvider.of<LoginBloc>(context)
                .add(SocialLoginEvent(type: SocialType.gmail)),
          ),
          SocialButton(
            type: SocialType.facebook,
            onPress: () => BlocProvider.of<LoginBloc>(context)
                .add(SocialLoginEvent(type: SocialType.facebook)),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
