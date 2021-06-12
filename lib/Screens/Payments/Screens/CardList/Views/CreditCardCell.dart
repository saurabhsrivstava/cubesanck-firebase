import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Payments/Bloc/index.dart';
import 'package:cubesnack/Screens/Payments/Models/MCardList.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditCardCell extends StatelessWidget {
  final MCard card;
  final PageMode mode;
  final Function deleteCard;
  const CreditCardCell({Key key, this.card, this.mode, this.deleteCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (mode == PageMode.select)
            BlocProvider.of<PaymentBloc>(context)
                .add(PickCardEvent(card: card));
        },
        child: BlocBuilder(
          builder: (context, state) {
            MCard sCard;
            if (state is CardSelectedDoneState) {
              sCard = state.card;
            }
            return Container(
              height: 150,
              padding: EdgeInsets.all(10),
              child: Card(
                color: AppColors.lightBlue,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("XXXXXXXXXXXX${card.last4}"),
                          Text(
                            "${card.brand}",
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("${card.name}"),
                          Spacer(),
                          (sCard != null && card.id == sCard.id)
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : Container(),
                        ],
                      ),
                      Row(
                        children: [
                          Text("${card.expMonth}/${card.expYear}"),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => deleteCard(context, card),
                            padding: EdgeInsets.zero,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          cubit: BlocProvider.of<PaymentBloc>(context),
        ));
  }
}
