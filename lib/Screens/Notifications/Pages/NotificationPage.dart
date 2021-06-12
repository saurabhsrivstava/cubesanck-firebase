import 'package:cubesnack/CommonViews/AppErrorView.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Notifications/Bloc/index.dart';
import 'package:cubesnack/Screens/Notifications/Models/MNotificationResponse.dart';
import 'package:cubesnack/Screens/Notifications/Views/NotificationListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationBloc bloc;
  List<MNotificationData> data;

  @override
  void initState() {
    super.initState();
    bloc = NotificationBloc(NotificationDefaultState());
    bloc.add(LoadNotificationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "notifications",
        ),
        body: BlocConsumer(
          builder: (context, state) {
            if (state is NotificationLoadingState) {
              return AppLoader();
            }
            if (state is ErrorNotificationState) {
              return AppErrorView(
                error: state.errorMessage,
                callBack: () {
                  bloc.add(LoadNotificationEvent());
                },
              );
            }
            if (state is NotificationDoneState) {
              data = state.notifications;
            }
            return NotificationListView(
              data: data,
            );
          },
          cubit: bloc,
          listener: (context, state) {},
        ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
