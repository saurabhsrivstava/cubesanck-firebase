import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryOptions extends StatelessWidget {
  final Axis direction;

  const DeliveryOptions({Key key, this.direction = Axis.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Flex(
        direction: direction,
        children: [
          Expanded(
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/location_icon.svg"),
                    SizedBox(width: 10, height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTitle(
                          title: "In-store Pick Up Available",
                          padding: EdgeInsets.only(bottom: 5),
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.semiBold,
                        ),
                        AppTitle(
                          title:
                              "Check availability at a near by store from this seller:",
                          padding: EdgeInsets.only(bottom: 5),
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.regular,
                          maxLines: 2,
                        ),
                        InkWell(
                          child: AppTitle(
                            title: "Enter zip code",
                            padding: EdgeInsets.only(bottom: 5),
                            fontSize: AppFont.title2,
                            decoration: TextDecoration.underline,
                            fontWeight: AppFont.medium,
                            maxLines: 2,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/delivery_truck.svg"),
                    SizedBox(width: 10, height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTitle(
                          title: "Get same-day delivery 121008",
                          padding: EdgeInsets.only(bottom: 5),
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.semiBold,
                          maxLines: 2,
                        ),
                        InkWell(
                          child: AppTitle(
                            title: "Enter zip code",
                            padding: EdgeInsets.only(bottom: 5),
                            fontSize: AppFont.title2,
                            decoration: TextDecoration.underline,
                            fontWeight: AppFont.medium,
                            maxLines: 2,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/security_check.svg",
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(width: 10, height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AppTitle(
                              title: "Buy this with confidence.",
                              fontSize: AppFont.title5,
                              fontWeight: AppFont.bold,
                              maxLines: 2,
                              padding: EdgeInsets.only(bottom: 5, top: 2),
                              color: AppColors.darkBlue,
                            ),
                            Row(
                              children: [
                                AppTitle(
                                  title:
                                      "This item is covered by Cubesnack's money back guarantee.",
                                  fontSize: AppFont.title1,
                                  fontWeight: AppFont.medium,
                                  maxLines: 2,
                                ),
                                AppTitle(
                                  title: "See Details",
                                  padding: EdgeInsets.only(bottom: 5, top: 2),
                                  fontSize: AppFont.title2,
                                  fontWeight: AppFont.medium,
                                  color: AppColors.darkBlue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
