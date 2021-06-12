import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Models/MReturn.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class SellerReturnInfoCell extends StatelessWidget {
  final MReturn item;
  const SellerReturnInfoCell({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Card(
        // margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: _OrderDate(item: item),
              height: 30,
            ),
            Divider(),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImage(
                    url: item?.images?.first?.image,
                  ),
                  Expanded(
                      child: _ProductDetails(
                    item: item,
                  )),
                  _OrderActionButtons(
                    item: item,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final MReturn item;
  const _ProductDetails({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: item.title,
            maxLines: 2,
            textAlign: TextAlign.start,
            fontWeight: AppFont.bold,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MultiTitle(
                    title: AppTitle(
                      title: "orderId",
                      fontSize: AppFont.title1,
                      fontWeight: AppFont.medium,
                      isLocalised: true,
                    ),
                    subTitle: AppTitle(
                      title: item.id,
                      fontSize: AppFont.title1,
                      fontWeight: AppFont.bold,
                      isLocalised: false,
                    ),
                  ),
                ),
                Expanded(
                  child: MultiTitle(
                    title: AppTitle(
                      title: "returnQuantity",
                      fontSize: AppFont.title1,
                      fontWeight: AppFont.medium,
                      isLocalised: true,
                    ),
                    subTitle: AppTitle(
                      title: "${item.quantity}",
                      fontSize: AppFont.title1,
                      fontWeight: AppFont.bold,
                      isLocalised: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MultiTitle(
              title: AppTitle(
                title: "returnReason",
                fontSize: AppFont.title1,
                fontWeight: AppFont.medium,
                isLocalised: true,
              ),
              subTitle: AppTitle(
                title: item.reason,
                fontSize: AppFont.title1,
                fontWeight: AppFont.bold,
                isLocalised: false,
              ),
            ),
          ),
          Expanded(
            child: MultiTitle(
              title: AppTitle(
                title: "buyerComments",
                fontSize: AppFont.title1,
                fontWeight: AppFont.medium,
                isLocalised: true,
              ),
              subTitle: AppTitle(
                title: item.description,
                fontSize: AppFont.title1,
                fontWeight: AppFont.bold,
                isLocalised: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderActionButtons extends StatelessWidget {
  final MReturn item;
  const _OrderActionButtons({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppRoundButton(
            title: "authorizedReturn",
            isRightIcon: false,
            borderColor: AppColors.greyBorder,
            isBorder: true,
            backgroundColor: Colors.white,
            width: 115,
            titleColor: AppColors.darkBlue,
            height: 30,
            fontSize: 10,
            onPressed: item.status == "authorized" ||
                    item.status == "return_successfully"
                ? null
                : () => _showAuthoriseReturn(context),
          ),
          AppRoundButton(
            title: "issueRefund",
            isRightIcon: false,
            borderColor: AppColors.greyBorder,
            isBorder: true,
            backgroundColor: Colors.white,
            width: 115,
            titleColor: AppColors.darkBlue,
            height: 30,
            fontSize: 10,
            onPressed: item.status == "return_successfully"
                ? null
                : () => _issueRefund(context),
          ),
          AppRoundButton(
            title: "dispute",
            isRightIcon: false,
            borderColor: AppColors.greyBorder,
            isBorder: true,
            backgroundColor: Colors.white,
            width: 115,
            titleColor: AppColors.darkBlue,
            height: 30,
            fontSize: 10,
          )
        ],
      ),
    );
  }

  _issueRefund(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle(
                    title: "Refund",
                    fontSize: AppFont.title3,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppTitle(
                                title: "Refund Item",
                              ),
                              Spacer(),
                              AppTitle(
                                title: "Amount",
                              )
                            ],
                          ),
                          Row(
                            children: [
                              AppTitle(
                                title: item.title,
                              ),
                              Spacer(),
                              AppTitle(
                                title: "${item.price}",
                              ),
                            ],
                          ),
                          AppTitle(
                            title: "Return Quantity: ${item.quantity}",
                          ),
                          AppTitle(
                            title: "Return Reason: ${item.reason}",
                          ),
                          AppTitle(
                            title: "Buyer Comments: ${item.description}",
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTitle(
                            title: "Additional Refund Charges",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AppTitle(
                                  title: "Restocking fee",
                                ),
                              ),
                              Card(
                                child: Text("%"),
                              ),
                              Expanded(
                                child: AppTextField(
                                  width: 40,
                                  height: 40,
                                ),
                              )
                            ],
                          ),
                          AppTitle(
                            title: "Total refund Amount",
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppRoundButton(title: "submit"),
                    ],
                  )
                ],
              ),
              height: 320,
            ));
  }

  _showAuthoriseReturn(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGroupCheckbox(
                      data: ["Accept", "Decline"],
                      title: "Are you sure you want to authorise this return?"),
                  SizedBox(
                    height: 20,
                  ),
                  AppTitle(
                    title: "Reason for decline",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppTextView(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppRoundButton(title: "submit"),
                    ],
                  )
                ],
              ),
              height: 320,
            ));
  }
}

class _OrderDate extends StatelessWidget {
  final MReturn item;
  const _OrderDate({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 127,
            child: MultiTitle(
              title: AppTitle(
                title: "orderDate",
                fontSize: AppFont.title0,
                fontWeight: AppFont.medium,
                isLocalised: true,
              ),
              subTitle: AppTitle(
                title: item.orderDate,
                fontSize: AppFont.title1,
                fontWeight: AppFont.bold,
                isLocalised: false,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: MultiTitle(
              title: AppTitle(
                title: "returnRequestDate",
                fontSize: AppFont.title0,
                fontWeight: AppFont.medium,
                isLocalised: true,
                maxLines: 1,
              ),
              subTitle: AppTitle(
                title: item.returnCreatedDate,
                fontSize: AppFont.title1,
                fontWeight: AppFont.bold,
                isLocalised: false,
              ),
            ),
          ),
          Container(
            width: 100,
            child: MultiTitle(
              title: AppTitle(
                title: "status",
                fontSize: AppFont.title0,
                fontWeight: AppFont.medium,
                isLocalised: true,
              ),
              subTitle: AppTitle(
                title: ": ${returnStatus[item.status]}",
                fontSize: AppFont.title1,
                fontWeight: AppFont.bold,
                isLocalised: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
