import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/Home/Bloc/index.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingInfoRow extends StatefulWidget {
  final Products product;
  ShippingInfoRow({Key key, this.product}) : super(key: key);

  @override
  _ShippingInfoRowState createState() => _ShippingInfoRowState();
}

class _ShippingInfoRowState extends State<ShippingInfoRow> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc(DefaultHomeState());
    // bloc.add(ProductShippingInfoEvent(
    //   productId: widget.product?.id,
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return AppLoader();
        }
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.domain_verification_outlined),
                  AppTitle(
                    title: "Fast & Free Shipping",
                    color: Colors.black,
                    fontSize: AppFont.title1,
                    padding: EdgeInsets.only(left: 5),
                  ),
                ],
              ),
              AppTitle(
                title: "Est.Delivery Fri, Jan 11",
                color: Colors.black,
                fontSize: AppFont.title1,
              ),
            ],
          ),
        );
      },
      cubit: bloc
        ..add(
          ProductShippingInfoEvent(productId: widget.product?.id),
        ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
