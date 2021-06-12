import 'package:cubesnack/CommonViews/BrowseFilePreview.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AppImagePickerView extends StatefulWidget {
  final Function valueCallBack;
  const AppImagePickerView({
    Key key,
    this.valueCallBack,
  }) : super(key: key);

  @override
  _AppImagePickerViewState createState() => _AppImagePickerViewState();
}

class _AppImagePickerViewState extends State<AppImagePickerView> {
  Asset pick;
  List<Asset> images;
  @override
  void initState() {
    images = List<Asset>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this._loadAssets(this.images),
      child: Container(
        height: 60,
        width: 60,
        //color: Colors.red,
        child: pick != null
            ? ImagePreview(
                valueCallBack: (v) => this.widget.valueCallBack(v),
                asset: pick,
              )
            : Container(
                child: Icon(Icons.camera),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyBorder)),
              ),
      ),
    );
  }

  Future<void> _loadAssets(List<Asset> images) async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
      this.setState(() {
        pick = resultList.first;
      });
      //this.widget.valueCallBack(resultList);
    } on Exception catch (e) {
      error = e.toString();
      appPrint(error);
    }
  }
}
