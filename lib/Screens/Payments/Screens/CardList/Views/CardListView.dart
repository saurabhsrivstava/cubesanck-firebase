import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Cart/Models/CartPayment.dart';
import 'package:cubesnack/Screens/Cart/Models/MCartOrder.dart';
import 'package:cubesnack/Screens/Payments/Bloc/index.dart';
import 'package:cubesnack/Screens/Payments/Models/MCardList.dart';
import 'package:cubesnack/Screens/Payments/Screens/CardList/Views/AddCardButton.dart';
import 'package:cubesnack/Screens/Payments/Screens/CardList/Views/CreditCardCell.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListView extends StatelessWidget {
  final List<MCard> cards;
  final PageMode mode;
  final double price;
  final String cartId;
  const CardListView({
    Key key,
    this.cards,
    this.mode,
    this.price,
    this.cartId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AddCardButton(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final MCard card = cards[index];
                return CreditCardCell(
                  card: card,
                  mode: mode,
                  deleteCard: _deleteCard,
                );
              },
              itemCount: cards != null ? cards.length : 0,
            ),
          ),
          BlocBuilder(
            builder: (context, state) {
              return state is CardSelectedDoneState
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppRoundButton(
                          title: "payNow",
                          isRightIcon: false,
                          onPressed: () => _makePayment(context, state.card),
                        ),
                      ],
                    )
                  : Container();
            },
            cubit: BlocProvider.of<PaymentBloc>(context),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  _makePayment(context, MCard card) {
    CartPayment order = CartPayment(
        amount: price,
        currency: "usd",
        source: card.id,
        receiptEmail: UserSession.shared.email ?? "support@cubesnack.com",
        obj: "card",
        cartId: cartId);
    BlocProvider.of<PaymentBloc>(context)
        .add(MakeCartPaymentEvent(order: order));
  }

  _deleteCard(context, card) {
    AppAlert.confirmationAlert(
        context: context,
        callBack: (v) {
          Navigator.pop(context);
          if (v == "yes") {
            BlocProvider.of<PaymentBloc>(context)
                .add(DeleteCardEvent(id: card.id, cards: cards));
          } else {}
        });
  }
}
