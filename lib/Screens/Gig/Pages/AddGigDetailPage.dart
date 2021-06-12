import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Screens/Gig/Bloc/index.dart';
import 'package:cubesnack/Screens/Gig/Views/AddGigDetailView.dart';
import 'package:cubesnack/Screens/Payments/Bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddGigDetailPage extends StatefulWidget {
  const AddGigDetailPage({Key key}) : super(key: key);

  @override
  _AddGigDetailPageState createState() => _AddGigDetailPageState();
}

class _AddGigDetailPageState extends State<AddGigDetailPage> {
  GigBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GigBloc(GigDefaultState());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer(
        cubit: bloc,
        builder: (context, state) {
          return Stack(
            children: [
              AddGigDetailView(),
              if (state is GigLoadingState) AppLoader()
            ],
          );
        },
        listener: (context, state) {
          if (state is AddCardDoneState) {}
        },
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
