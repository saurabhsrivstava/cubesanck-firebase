import 'package:cubesnack/CommonViews/AppBorderLabel.dart';
import 'package:cubesnack/CommonViews/AppImagePickerView.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'ColorVariationOptions.dart';

class BlankColorVariation extends StatefulWidget {
  final dynamic data;
  final MColorVariation contrrollers;
  const BlankColorVariation({Key key, this.data, this.contrrollers})
      : super(key: key);

  @override
  _BlankColorVariationState createState() => _BlankColorVariationState();
}

class _BlankColorVariationState extends State<BlankColorVariation> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.greyBorder)),
      child: Column(
        children: [
          Row(
            children: [
              if (this.widget.data != null)
                ...this
                    .widget
                    .data
                    .map(
                      (obj) => Container(
                        margin: EdgeInsets.only(right: 10),
                        child: AppBorderLabel(
                          title: obj["name"] ?? "",
                        ),
                        width: 100,
                      ),
                    )
                    .toList(),
              Spacer(),
              // IconButton(
              //     icon: Icon(
              //       Icons.arrow_drop_down_circle_outlined,
              //       color: AppColors.greyBorder,
              //     ),
              //     onPressed: () {
              //       this.setState(() {
              //         isOpen = !isOpen;
              //       });
              //     })
            ],
          ),
          Divider(),
          isOpen
              ? _BlankColorVariationDetail(
                  contrrollers: this.widget.contrrollers,
                )
              : Container()
        ],
      ),
    );
  }
}

class _BlankColorVariationDetail extends StatelessWidget {
  final MColorVariation contrrollers;
  const _BlankColorVariationDetail({Key key, this.contrrollers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppImagePickerView(
              valueCallBack: (v) {
                contrrollers.image = v;
              },
            ),
            SizedBox(width: 10),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: AppTitleTextField(
                      title: "Regular price*",
                      controller: contrrollers.regPrice,
                      height: 30,
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: AppTitleTextField(
                      title: "Sell price",
                      height: 30,
                      controller: contrrollers.sellPrice,
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: AppTitleTextField(
                      subTitle: "SKU*",
                      controller: contrrollers.sku,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: AppTitleTextField(
                      subTitle: "Max order quantity*",
                      controller: contrrollers.maxbrderQuantity,
                      height: 30,
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: AppTitleTextField(
                      subTitle: "Available quantity*",
                      controller: contrrollers.availableQuantity,
                      height: 30,
                      keyBoardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
