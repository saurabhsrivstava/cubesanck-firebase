import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/CommonViews/BrowseFilePreview.dart';
import 'package:cubesnack/CommonViews/DocumentPicker.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Views/SellerAddress.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'StoreManagerInfo.dart';
import 'StoreServices.dart';

class SellerViewEditBuilder extends StatelessWidget {
  final MStore store;
  final PageMode status;
  const SellerViewEditBuilder({Key key, this.store, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTitleTextField(
            title: "Business Name*",
            onChange: (v) {
              store.buisnessName = v;
            },
            value: store.buisnessName ?? "",
          ),
          AppTitleTextField(
            title: "Store Display Name*",
            marginTop: 15.0,
            onChange: (v) {
              store.displayName = v;
            },
            value: store.displayName ?? "",
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                title: "Upload bussiness Logo*",
                fontWeight: FontWeight.w600,
                fontSize: AppFont.title3,
                padding: EdgeInsets.only(top: 15),
              ),
              store.logo != null && status == PageMode.edit
                  ? Image.network(
                      store.logo,
                      height: 80,
                    )
                  : BrowseFilePreview(
                      padding: EdgeInsets.only(top: 5),
                      valueCallBack: (id) {
                        store.logo = id;
                      },
                    ),
            ],
          ),
          SellerAddress(
            title: "address",
            address: store.address,
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppTitle(
                  title: "Uploa documents*",
                  fontWeight: FontWeight.w600,
                  fontSize: AppFont.title3,
                ),
                DocumentPicker(
                  statusCallBack: (v) {
                    store.documents.add(v);
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppTitle(
                  title: "Uploa Store front images*",
                  fontWeight: FontWeight.w600,
                  fontSize: AppFont.title3,
                ),
                BrowseFilePreview(
                  padding: EdgeInsets.only(),
                  valueCallBack: (id) {
                    store.frontImages.add(id);
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppTitle(
                  title: "Business Description",
                  fontWeight: FontWeight.w600,
                  fontSize: AppFont.title3,
                  padding: EdgeInsets.only(bottom: 5, top: 15),
                ),
                AppTextView(
                  onChange: (v) {
                    store.buisnessDescription = v;
                  },
                  value: store.buisnessDescription,
                ),
              ],
            ),
          ),
          StoreManagerInfo(
            store: store,
          ),
          StoreServices(
            store: store,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppRoundButton(
                  margin: 30,
                  title: "continue",
                  onPressed: () => this._continuePress(context)),
            ],
          )
        ],
      ),
    );
  }

  _continuePress(context) {
    final error = store.validate();
    if (error == null) {
      BlocProvider.of<SellerSignupBloc>(context)
          .add(AddStoreEvent(store: store));
      //api call
    } else {
      AppAlert.showAlert(title: "Error", message: error, context: context, isLocalised: true);
    }
  }
}
