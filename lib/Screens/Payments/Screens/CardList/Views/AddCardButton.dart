import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Payments/Bloc/index.dart';
import 'package:cubesnack/Screens/Payments/Screens/AddCard/Pages/AddCardPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardButton extends StatelessWidget {
  const AddCardButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddCardPage())).then((value) =>
              {BlocProvider.of<PaymentBloc>(context).add(LoadCardListEvent())});
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
                title: "addCard",
                isLocalised: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
