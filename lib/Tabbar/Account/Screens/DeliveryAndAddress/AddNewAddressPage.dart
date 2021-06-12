import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Views/SellerAddress.dart';
import 'package:cubesnack/Tabbar/Account/Bloc/Account_bloc.dart';
import 'package:cubesnack/Tabbar/Account/Bloc/index.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class AddNewAddressPage extends StatelessWidget {
  final AccountBloc bloc;
  final MUserAddress address;
  const AddNewAddressPage({Key key, this.address, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "addNewAddress",
        ),
        body: BlocConsumer(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 3,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTitle(
                              title: "Contact Info",
                              fontSize: AppFont.title5,
                              fontWeight: AppFont.bold,
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            AppTextField(
                              hintText: "Full Name",
                              onChange: (v) {
                                this.address.name = v;
                              },
                              value: this.address.name,
                            ),
                            // AppTextField(hintText: " Phone Number"),
                            SellerAddress(
                              address: address.address,
                            ),
                            AppGroupCheckbox(
                              data: ["Yes", "No"],
                              title: "Use this as default address",
                              value: this.address.isDefault ? "Yes" : "No",
                              valueCallBack: (v, i) {
                                this.address.isDefault =
                                    v == "Yes" ? true : false;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppRoundButton(
                                  fontSize: 18,
                                  margin: 30,
                                  title: "save",
                                  onPressed: () => this._submitPress(context),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state is AccountLoadingState) AppLoader()
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is ErrorAccountState) {
              AppAlert.showAlert(
                  context: context,
                  title: "Error",
                  message: state.errorMessage);
            }
            if (state is AddressDoneState) {
              Toast.show("Address added", context);
              Navigator.pop(context);
            }
          },
          cubit: this.bloc,
        ));
  }

  _submitPress(context) {
    final error = this.address.validate();
    if (error != null) {
      AppAlert.showAlert(context: context, title: "error", message: error);
    } else {
      this.bloc.add(AddNewAddressEvent(address: this.address));
    }
  }
}
