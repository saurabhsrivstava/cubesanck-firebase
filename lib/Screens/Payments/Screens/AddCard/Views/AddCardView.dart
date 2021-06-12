import 'package:cubesnack/Screens/Payments/Bloc/index.dart';
import 'package:cubesnack/Screens/Payments/Screens/CardList/Views/CreditCardWidget.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({Key key}) : super(key: key);

  @override
  _AddCardViewState createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  CreditCardModel card;

  @override
  void initState() {
    card = CreditCardModel("", "", "", "", false);
    super.initState();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CreditCardForm(
                    formKey: formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: card.cardNumber,
                    cvvCode: card.cvvCode,
                    cardHolderName: card.cardHolderName,
                    expiryDate: card.expiryDate,
                    themeColor: Colors.blue,
                    cardNumberDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary: const Color(0xff1b447b),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'halter',
                          fontSize: 14,
                          package: 'flutter_credit_card',
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        appPrint('valid!');
                        BlocProvider.of<PaymentBloc>(context)
                            .add(AddCardEvent(card: card));
                      } else {
                        appPrint('invalid!');
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      card.cardNumber = creditCardModel.cardNumber;
      card.expiryDate = creditCardModel.expiryDate;
      card.cardHolderName = creditCardModel.cardHolderName;
      card.cvvCode = creditCardModel.cvvCode;
      card.isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

extension CreditCardModelExt on CreditCardModel {
  toJson() {
    final dates = this.expiryDate.split("/");
    return {
      "object": "card",
      "name": this.cardHolderName,
      "exp_year": int.parse(dates[1]),
      "exp_month": int.parse(dates[0]),
      "number": this.cardNumber
    };
  }
}
