import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Cart/Models/FastShippingResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FastShippingCell extends StatefulWidget {
  final String productId;
  final String addressId;
  final Function valueCallBack;
  final CartDelivery type;
  const FastShippingCell(
      {Key key, this.productId, this.addressId, this.valueCallBack, this.type})
      : super(key: key);

  @override
  _FastShippingCellState createState() => _FastShippingCellState();
}

class _FastShippingCellState extends State<FastShippingCell> {
  CartBloc bloc;
  List<FastShipping> options;

  @override
  void initState() {
    bloc = CartBloc(CartLoadingState());
    bloc.add(GetDeliveryOptionsEvent(
        productId: widget.productId, addressId: widget.addressId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is CartLoadingState) {
          return AppLoader(
            height: 50,
            bgColor: Colors.white,
          );
        }
        if (state is FastShippingDoneState) {
          options = state.items;
          //Filter for type
          if (CartDelivery.fastShipping == widget.type) {
            options = state.items
                .where(
                  (e) => e.carrier != "FedEx",
                )
                .toList();
            if (options.length > 3) options = options.sublist(0, 3);
          }
          if (CartDelivery.home == widget.type) {
            state.items.sort((a, b) {
              return a.rate.compareTo(b.rate);
            });
            if (options.length > 1) options = options.sublist(0, 1);
          }
        }
        if (state is ErrorCartState) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: AppTitle(
              title: "No shipping options availbale",
            ),
          );
        }
        if (options != null) {
          this.widget.valueCallBack(options[0]);
        }
        return options != null
            ? Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppGroupCheckbox(
                      data: options
                          .map((e) =>
                              "\$${e.rate} Deliver in ${e.deliveryDays} day")
                          .toList(),
                      title: "Fastshipping options",
                      type: GroupCheckType.vertcle,
                      valueCallBack: (v, i) {
                        print(i);
                        this.widget.valueCallBack(options[i]);
                      },
                    )
                  ],
                ),
              )
            : Container();
      },
      cubit: bloc,
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
