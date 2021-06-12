import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'BrowseFilePreview.dart';

class ProfileImagePicker extends StatefulWidget {
  final Function valueCallBack;
  final String url;
  const ProfileImagePicker({Key key, @required this.valueCallBack, this.url})
      : super(key: key);

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  Asset pick;
  List<Asset> images = List<Asset>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: Colors.grey[400], width: 5),
              color: AppColors.grey200,
            ),
            child: pick != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ImagePreview(
                      key: Key(pick.identifier),
                      asset: pick,
                      deleteImage: this._deleteImage,
                      valueCallBack: this.widget.valueCallBack,
                      isCenter: true,
                      isDelete: false,
                    ),
                  )
                : ClipRRect(
                    child: Image.network(this.widget.url ?? ""),
                    borderRadius: BorderRadius.circular(50)),
          ),
          Positioned(
            child: Container(
                alignment: Alignment.center,
                height: 37,
                width: 37,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.darkBlue),
                child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () => _loadAssets(images))),
            right: 0,
            bottom: 0,
          )
        ],
      ),
    );
  }

  _deleteImage() {}

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
        //this.widget.valueCallBack(pick);
      });
      //this.widget.valueCallBack(resultList);
    } on Exception catch (e) {
      error = e.toString();
      appPrint(error);
    }
  }
}
