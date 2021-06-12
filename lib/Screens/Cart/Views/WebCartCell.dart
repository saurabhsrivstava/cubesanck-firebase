import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Cart/Models/FastShippingResponse.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Screens/Cart/Views/CartPreference.dart';
import 'package:cubesnack/Screens/Cart/Views/CartQuantiityCell.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';

class WebCartCell extends StatefulWidget {
  final int index;
  final MCartItem item;
  final List<FastShipping> deliveryOptions;

  const WebCartCell({Key key, this.index, this.item, this.deliveryOptions})
      : super(key: key);

  @override
  _WebCartCellState createState() => _WebCartCellState();
}

class _WebCartCellState extends State<WebCartCell> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        children: [
          Row(
            children: [
              ProductImage(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle(
                    title: this.widget.item.product.title ?? "",
                    maxLines: 2,
                    color: Colors.black,
                    fontWeight: AppFont.medium,
                    fontSize: AppFont.title3,
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                  ),
                  AppTitle(
                    title: "\$${this.widget.item.product.price}",
                    maxLines: 2,
                    color: Colors.black,
                    fontWeight: AppFont.bold,
                    fontSize: AppFont.extra,
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                  ),
                  Image.asset(
                    "assets/images/returns available.png",
                    width: 200,
                    height: 70,
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(3)),
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.blue),
                      width: 15,
                      height: 15,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CartQuanntityCell(
                    item: widget.item,
                  )
                ],
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: CartPreference(
                  margin: 10,
                  callBack: (v, index) {
                    this.setState(() {
                      this.widget.item.delivery = v;
                    });
                    appPrint(index);
                  },
                  index: widget.index,
                  item: widget.item,
                  deliveryOptions: widget.deliveryOptions,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String url;
  final bool isSelected;

  const ProductImage(
      {Key key,
      // this.url = "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      this.url =
          "https://assets.ajio.com/medias/sys_master/root/h8e/hf6/13018712604702/-473Wx593H-460342492-blue-OUTFIT2.jpg",
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      child: CachedNetworkImage(
        imageUrl: url,
      ),
    );
  }
}
