import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Payments/Bloc/index.dart';
import 'package:cubesnack/Screens/Payments/Screens/AddCard/Views/AddCardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({Key key}) : super(key: key);

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  PaymentBloc bloc;

  @override
  void initState() {
    bloc = PaymentBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "addCard",
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer(
          builder: (context, state) {
            return Stack(
              children: [
                AddCardView(),
                if (state is CardLoadingState) AppLoader()
              ],
            );
          },
          listener: (context, state) {
            if (state is AddCardDoneState) {
              Navigator.pop(context);
            }
          },
          cubit: bloc,
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
