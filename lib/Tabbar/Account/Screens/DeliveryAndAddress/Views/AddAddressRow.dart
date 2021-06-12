import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Tabbar/Account/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/AddNewAddressPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressRow extends StatefulWidget {
  const AddAddressRow({
    Key key,
  }) : super(key: key);

  @override
  _AddAddressRowState createState() => _AddAddressRowState();
}

class _AddAddressRowState extends State<AddAddressRow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AccountBloc>(context);
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewAddressPage(
                        bloc: bloc,
                        address: MUserAddress.init(),
                      ))).then((value) => {bloc.add(AllAddressEvent())});
        },
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_box,
                color: AppColors.darkBlue,
              ),
              AppTitle(
                title: "addADeliveryAddress",
                isLocalised: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
