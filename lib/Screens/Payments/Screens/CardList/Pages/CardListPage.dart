import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Cart/Bloc/Cart_state.dart';
import 'package:cubesnack/Screens/Cart/Models/CartPayment.dart';
import 'package:cubesnack/Screens/Cart/Models/MCartOrder.dart';
import 'package:cubesnack/Screens/Payments/Bloc/Payment_bloc.dart';
import 'package:cubesnack/Screens/Payments/Bloc/index.dart';
import 'package:cubesnack/Screens/Payments/Models/MCardList.dart';
import 'package:cubesnack/Screens/Payments/Screens/CardList/Views/CardListView.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class CardListPage extends StatefulWidget {
  final PageMode mode;
  final bool isNew;
  final bool isNavBar;
  final Function callBack;
  CardListPage(
      {Key key,
      this.mode,
      this.isNavBar = true,
      this.isNew = false,
      this.callBack})
      : super(key: key);

  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  PaymentBloc bloc;
  List<MCard> cards;

  @override
  void initState() {
    bloc = PaymentBloc();
    if (widget.isNew == false) bloc.add(LoadCardListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> data = ModalRoute.of(context).settings.arguments;
    MCartOrder order;
    Object invoiceData;
    if (data != null) {
      order = data["order"];
      invoiceData = data["invoiceData"];
    }

    return Scaffold(
      bottomSheet: // if (isNew)
          widget.isNew
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      child: AppRoundButton(
                        width: 200,
                        isLocalised: false,
                        title: "Submit for approval",
                        onPressed: this.widget.callBack != null
                            ? () => this.widget.callBack()
                            : () {
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              },
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 0,
                ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer(
          builder: (context, state) {
            if (state is CardFetchDoneState) {
              cards = state.cards;
            }

            return Stack(
              children: [
                CardListView(
                  cards: cards,
                  mode: order != null ? PageMode.select : PageMode.view,
                  price: order?.total ?? 0.0,
                  cartId: order?.cartId,
                ),
                if (state is CardLoadingState) AppLoader()
              ],
            );
          },
          listener: (context, state) {
            if (state is CartPaymentDoneState) {
              if (state.isInvoice)
                Toast.show("Order placed successfully", context);
              if (!state.isInvoice)
                bloc.add(CreateCartInvoiceEvent(
                    invoiceData: invoiceData, orderId: state.orderId));
              if (state.isInvoice) {
                UserSession.shared.refreshCart();
                Navigator.of(context).popUntil((route) => route.isFirst);
              }

              //Navigator.of(context).popUntil(ModalRoute.withName("/"));
            }
            if (state is ErrorPaymentState) {
              AppAlert.showAlert(
                  context: context,
                  title: "Error",
                  message: state.errorMessage);
            }
          },
          cubit: bloc,
        ),
      ),
      appBar: widget.isNavBar
          ? Navbar(
              title: "paymentAndBilling",
            )
          : null,
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
