import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/BrowseFileButton.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class StoreLogoButton extends StatelessWidget {
  const StoreLogoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTitle(
            title: "Upload Business Logo*",
            fontWeight: FontWeight.w600,
            fontSize: AppFont.title3,
          ),
          BrowseFileButton(onPressed: () {}, selectedImages: List<Asset>()),
        ],
      ),
    );
  }
}
