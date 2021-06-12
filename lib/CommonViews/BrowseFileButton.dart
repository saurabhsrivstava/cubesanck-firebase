import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class BrowseFileButton extends StatelessWidget {
  final Function onPressed;
  final List<Asset> selectedImages;
  const BrowseFileButton(
      {Key key, @required this.onPressed, this.selectedImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 5),
      // padding: EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      child: FlatButton.icon(
          onPressed: () => this._loadAssets(selectedImages),
          icon: Icon(Icons.folder),
          label: Text("Choose file")),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey[300])),
    );
  }

  Future<void> _loadAssets(List<Asset> images) async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
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
      this.onPressed(resultList);
    } on Exception catch (e) {
      error = e.toString();
      appPrint(error);
    }
  }
}
