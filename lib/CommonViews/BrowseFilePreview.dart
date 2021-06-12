import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Bloc/index.dart';
import 'package:cubesnack/CommonViews/BrowseFileButton.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class BrowseFilePreview extends StatefulWidget {
  final EdgeInsets padding;
  final Function valueCallBack;
  BrowseFilePreview(
      {Key key, this.padding = EdgeInsets.zero, @required this.valueCallBack})
      : super(key: key);

  @override
  _BrowseFilePreviewState createState() => _BrowseFilePreviewState();
}

class _BrowseFilePreviewState extends State<BrowseFilePreview> {
  List<Asset> images = List<Asset>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.widget.padding,
      child: Column(
        children: <Widget>[
          BrowseFileButton(
            onPressed: (v) {
              this.setState(() {
                images = v;
              });
            },
            selectedImages: images,
          ),
          images.length > 0
              ? Container(
                  margin: EdgeInsets.only(top: 5),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: List.generate(images.length, (index) {
                      Asset asset = images[index];
                      return ImagePreview(
                        key: Key(asset.identifier),
                        asset: asset,
                        deleteImage: this._deleteImage,
                        valueCallBack: this.widget.valueCallBack,
                      );
                    }),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  _deleteImage(asset) {
    this.setState(() {
      images.remove(asset);
    });
  }
}

class ImagePreview extends StatefulWidget {
  final Asset asset;
  final Function deleteImage;
  final Function valueCallBack;
  final bool isDelete;
  final bool isCenter;

  const ImagePreview(
      {Key key,
      this.asset,
      this.deleteImage,
      @required this.valueCallBack,
      this.isDelete = true,
      this.isCenter = false})
      : super(key: key);

  @override
  ImagePreviewState createState() => ImagePreviewState();
}

class ImagePreviewState extends State<ImagePreview> {
  FileUploadBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = FileUploadBloc(DefaultFileUploadState());
    bloc.add(UploadFileEvent(url: this.widget.asset.identifier, isAsset: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        builder: (context, state) {
          if (state is FileUploadDoneState) {
            this.widget.valueCallBack(state.responnse.ids.first);
            appPrint(state.responnse.ids);
          }

          return Stack(
            children: [
              AssetThumb(
                asset: widget.asset,
                width: 200,
                height: 200,
              ),
              Row(
                crossAxisAlignment: this.widget.isCenter
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                mainAxisAlignment: this.widget.isCenter
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
                children: [
                  if (state is FileUploadProcessingState)
                    Container(
                      height: 20,
                      width: 20,
                      child: AppLoader(
                        bgColor: Colors.transparent,
                      ),
                    ),
                  if (state is FileUploadDoneState)
                    if (this.widget.isDelete)
                      InkWell(
                          child: Icon(Icons.cancel, color: Colors.red),
                          onTap: () =>
                              this.widget.deleteImage(this.widget.asset)),
                  if (state is ErrorFileUploadState)
                    InkWell(
                        child: Icon(Icons.refresh, color: Colors.red),
                        onTap: () => this._sendAgain(this.widget.asset)),
                ],
              )
            ],
          );
        },
        cubit: bloc,
        listener: (context, state) {
          // if (state is ErrorFileUploadState) {
          //   this.widget.deleteImage(this.widget.asset);
          // }
        });
  }

  _sendAgain(asset) {
    bloc.add(UploadFileEvent(url: asset.identifier, isAsset: true));
  }
}
