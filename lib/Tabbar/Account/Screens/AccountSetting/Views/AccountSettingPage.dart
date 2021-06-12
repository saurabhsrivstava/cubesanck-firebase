import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Bloc/Profile_bloc.dart';
import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Models/MUserProfile.dart';
import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Views/AccountSettingBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({Key key}) : super(key: key);

  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  ProfileBloc bloc;
  final userNameCnt = TextEditingController();
  final emailCnt = TextEditingController();
  final phoneCnt = TextEditingController();
  final passCnt = TextEditingController();
  final confPassCnt = TextEditingController();
  MUserProfile profile;

  @override
  void initState() {
    bloc = ProfileBloc(ProfileDefaultState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "accountSettings",
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer(
          builder: (context, state) {
            if (state is ProfileDoneState) profile = state.profile;
            return Stack(
              children: [
                AccountSettingBuilder(
                  profile: profile,
                  userNameCnt: userNameCnt,
                  emailCnt: emailCnt,
                  phoneCnt: phoneCnt,
                  passwordCnt: passCnt,
                  confPassCnt: confPassCnt,
                ),
                if (state is ProfileLoadingState) AppLoader()
              ],
            );
          },
          listener: (context, state) {
            if (state is ErrorProfileState) {
              AppAlert.showAlert(
                  context: context,
                  title: "error",
                  message: state.errorMessage);
            }
            if (state is ProfileDoneState) {
              Toast.show("Profile updated successfully", context, gravity: 2);
            }
          },
          cubit: bloc..add(LoadProfileEvent()),
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    userNameCnt.dispose();
    emailCnt.dispose();
    confPassCnt.dispose();
    passCnt.dispose();
    phoneCnt.dispose();
    super.dispose();
  }
}
