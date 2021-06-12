import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Tabbar/Account/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/Views/DeliveryAddressBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAddressPage extends StatefulWidget {
  final Function addressCallBack;
  final PageMode mode;
  final bool isNavBar;
  const DeliveryAddressPage(
      {Key key, this.addressCallBack, this.mode, this.isNavBar = true})
      : super(key: key);
  @override
  _DeliveryAddressPageState createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  AccountBloc bloc;
  List<MUserAddress> address;

  @override
  void initState() {
    bloc = AccountBloc(AccountDefaultState());
    bloc.add(AllAddressEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: this.widget.isNavBar
            ? Navbar(
                title: "deliveryAndAddress",
              )
            : null,
        body: BlocProvider(
          create: (context) => bloc,
          child: BlocConsumer(
            builder: (context, state) {
              if (state is AccountLoadingState) {
                return AppLoader();
              }

              if (state is AddressDoneState) {
                address = state.address;
              }
              return DeliveryAddressBuilder(
                address: address,
                addressCallBack: widget.addressCallBack,
                mode: widget.mode,
              );
            },
            listener: (context, state) {},
            cubit: bloc,
          ),
        ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
