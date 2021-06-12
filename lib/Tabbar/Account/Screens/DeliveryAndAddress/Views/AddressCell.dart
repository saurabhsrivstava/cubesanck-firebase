import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Tabbar/Account/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/AddNewAddressPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCell extends StatelessWidget {
  final MUserAddress address;
  final MUserAddress selectedAddress;
  final Function selectedCallBack;
  final PageMode mode;
  const AddressCell(
      {Key key,
      this.address,
      this.selectedAddress,
      this.selectedCallBack,
      this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            if (mode == PageMode.select) this.selectedCallBack(address);
          },
          child: Card(
            elevation: 3,
            margin: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle(
                    title: this.address.name,
                    fontSize: AppFont.title3,
                    fontWeight: AppFont.bold,
                    padding: EdgeInsets.only(bottom: 7),
                  ),
                  AppTitle(
                    title: this.address.address.address1,
                    fontSize: AppFont.title2,
                    color: AppColors.grey600,
                  ),
                  AppTitle(
                    title:
                        "${this.address.address.address2} ${this.address.address.city} ${this.address.address.state} ${this.address.address.phone}",
                    fontSize: AppFont.title2,
                    color: AppColors.grey600,
                  ),
                  Divider(),
                  Row(
                    children: [
                      AppRoundButton(
                        title: "edit",
                        width: 70,
                        height: 20,
                        isRightIcon: false,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.greyBorder,
                        isBorder: true,
                        titleColor: Colors.blue,
                        fontSize: AppFont.title1,
                        onPressed: () {
                          final bloc = BlocProvider.of<AccountBloc>(context);
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddNewAddressPage(
                                            address: address,
                                            bloc: bloc,
                                          )))
                              .then((value) => {bloc.add(AllAddressEvent())});
                        },
                      ),
                      SizedBox(width: 30),
                      AppRoundButton(
                        title: "delete",
                        width: 70,
                        height: 20,
                        isRightIcon: false,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.greyBorder,
                        isBorder: true,
                        titleColor: Colors.blue,
                        fontSize: AppFont.title1,
                        onPressed: () => this._deleteAddress(context, address),
                      ),
                      Spacer(),
                      if (selectedAddress != null &&
                          address.id == selectedAddress.id)
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        if (address.isDefault)
          Positioned(
            right: 15,
            top: 15,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.darkBlue,
                  ),
                  child: AppTitle(
                    color: Colors.white,
                    title: "Default",
                    fontSize: AppFont.title1,
                    padding: EdgeInsets.only(right: 5, left: 5),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color:
                          address.isDefault ? AppColors.darkBlue : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.greyBorder)),
                )
              ],
            ),
          )
      ],
    );
  }

  _deleteAddress(BuildContext context, MUserAddress address) {
    AppAlert.confirmationAlert(
        context: context,
        title: "areYouSure",
        message: "",
        callBack: (v) {
          Navigator.pop(context);
          if (v == 'yes') {
            BlocProvider.of<AccountBloc>(context)
                .add(DeleteAddressEvent(addressId: address.id));
          } else {}
        });
  }
}
