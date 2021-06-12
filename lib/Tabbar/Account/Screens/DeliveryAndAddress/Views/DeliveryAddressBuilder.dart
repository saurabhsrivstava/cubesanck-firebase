import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Payments/Screens/CardList/Pages/CardListPage.dart';
import 'package:cubesnack/Tabbar/Account/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/Views/AddAddressRow.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/Views/AddressCell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAddressBuilder extends StatefulWidget {
  final List<MUserAddress> address;
  final Function addressCallBack;
  final PageMode mode;
  const DeliveryAddressBuilder({
    Key key,
    this.address,
    this.addressCallBack,
    this.mode,
  }) : super(key: key);

  @override
  _DeliveryAddressBuilderState createState() => _DeliveryAddressBuilderState();
}

class _DeliveryAddressBuilderState extends State<DeliveryAddressBuilder> {
  MUserAddress selectedAddress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddAddressRow(),
        if (widget.address != null)
          Expanded(
            child: Container(
                child: ListView.builder(
              itemBuilder: (context, index) {
                final MUserAddress address = this.widget.address[index];
                return AddressCell(
                  address: address,
                  selectedAddress: selectedAddress,
                  selectedCallBack: _selectedAddress,
                  mode: widget.mode,
                );
              },
              itemCount: this.widget.address.length,
            )),
          ),
        // if (widget.mode == PageMode.select)
        //   AppRoundButton(
        //     title: "next",
        //     margin: 20,
        //     onPressed: () => _nextPress(),
        //   )
      ],
    );
  }

  _nextPress() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return CardListPage(
            isNavBar: false,
            mode: PageMode.select,
          );
        });
  }

  _selectedAddress(address) {
    this.setState(() {
      selectedAddress = address;
      this.widget.addressCallBack(address);
    });
  }
}
