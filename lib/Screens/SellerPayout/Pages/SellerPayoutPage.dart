import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/Screens/SellerPayout/Bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerPayoutPage extends StatefulWidget {
  const SellerPayoutPage({Key key}) : super(key: key);

  @override
  _SellerPayoutPageState createState() => _SellerPayoutPageState();
}

class _SellerPayoutPageState extends State<SellerPayoutPage> {
  SellerPayoutBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SellerPayoutBloc(SellerPayoutDefaultState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
      builder: (context, state) {
        if (state is SellerPayoutLoadingState) {
          return AppLoader();
        }

        if (state is SellerPayoutDoneState) {}
        return ListView.builder(
          itemBuilder: (context, index) {
            return Container();
          },
          itemCount: 3,
        );
      },
      cubit: bloc,
    ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
