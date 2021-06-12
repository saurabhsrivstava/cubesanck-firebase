import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/BrowseFileButton.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class StoreDocButton extends StatelessWidget {
  const StoreDocButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MultiTitle(
            title: AppTitle(
              title: "Upload Documents",
              fontSize: AppFont.title2,
            ),
            subTitle: AppTitle(
              title:
                  " (Copy of the utility bill/lease agreement/business licence)",
              fontSize: AppFont.title1,
            ),
          ),
          BrowseFileButton(
            onPressed: () {},
            selectedImages: List<Asset>(),
          ),
        ],
      ),
    );
  }
}
