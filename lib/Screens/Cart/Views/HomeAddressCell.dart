import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Cart/Bloc/Cart_bloc.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Account/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/DeliveryAddressPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'FastShippingCell.dart';

class HomeAddressCell extends StatefulWidget {
  final Function callBack;
  final String title;
  final bool isDeliveryOptions;
  final String productId;
  final Function shippingCallBack;
  final CartDelivery type;
  const HomeAddressCell(
      {Key key,
      this.callBack,
      this.title = "Client Address",
      this.isDeliveryOptions = false,
      this.productId,
      this.shippingCallBack,
      this.type})
      : super(key: key);

  @override
  _HomeAddressCellState createState() => _HomeAddressCellState();
}

class _HomeAddressCellState extends State<HomeAddressCell> {
  AccountBloc bloc = AccountBloc(AccountDefaultState());
  MUserAddress address;
  bool isNew = false;

  @override
  void initState() {
    bloc.add(AllAddressEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        if (state is AccountLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is AddressDoneState && isNew == false) {
          address = state.address.length > 0
              ? state.address.firstWhere((address) => address.isDefault == true,
                  orElse: null)
              : null;
          if (address != null) this.widget.callBack(address);
        }
        return Container(
          child: Row(
            children: [
              address != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppTitle(
                          title: widget.title,
                          fontWeight: AppFont.bold,
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                        ),
                        AppTitle(
                          title: address.name ?? "",
                          fontSize: AppFont.title3,
                          fontWeight: AppFont.bold,
                          padding: EdgeInsets.only(bottom: 7),
                        ),
                        AppTitle(
                          title: address.address.address1,
                          fontSize: AppFont.title2,
                          color: AppColors.grey600,
                        ),
                        AppTitle(
                          title:
                              "${address.address.address2} ${address.address.city} ${address.address.state} ${address.address.phone}",
                          fontSize: AppFont.title2,
                          color: AppColors.grey600,
                        ),
                        if (widget.isDeliveryOptions && address != null)
                          FastShippingCell(
                            productId: widget.productId,
                            addressId: address.id,
                            type: widget.type,
                            valueCallBack: (v) =>
                                this.widget.shippingCallBack(v),
                          ),
                      ],
                    )
                  : AppTitle(title: "No Default Address"),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeliveryAddressPage(
                                addressCallBack: (a) {
                                  this.setState(() {
                                    address = a;
                                    if (address != null)
                                      this.widget.callBack(address);
                                    isNew = true;
                                  });
                                },
                                mode: PageMode.select,
                              )));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add_box_rounded,
                      color: AppColors.darkBlue,
                    ),
                    AppTitle(title: "Manage Address")
                  ],
                ),
              )
            ],
          ),
        );
      },
      cubit: bloc,
      listener: (context, state) {
        if (state is ErrorAccountState) {
          AppAlert.showAlert(
              context: context, title: "Error", message: state.errorMessage);
        }
      },
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
