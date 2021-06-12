import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Bloc/fileUpload_bloc.dart';
import 'package:cubesnack/CommonViews/Bloc/fileUpload_state.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/index.dart';

class DocumentPicker extends StatefulWidget {
  final Function statusCallBack;
  DocumentPicker({Key key, this.statusCallBack}) : super(key: key);

  @override
  _DocumentPickerState createState() => _DocumentPickerState();
}

class _DocumentPickerState extends State<DocumentPicker> {
  // List<Asset> images = List<Asset>();
  FileUploadBloc bloc;
  String path;

  @override
  void initState() {
    bloc = FileUploadBloc(DefaultFileUploadState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is FileUploadDoneState) {
          this.widget.statusCallBack(state.responnse.ids.first);
        }
        return Column(
          children: <Widget>[
            Material(
              elevation: 1,
              shadowColor: AppColors.greyBorder,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 5),
                // padding: EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                        onPressed: () => this._loadDocument(),
                        icon: Icon(Icons.folder),
                        label: Text("Choose file")),
                    if (state is FileUploadProcessingState)
                      Container(
                        child: AppLoader(
                          bgColor: Colors.white,
                        ),
                        width: 30,
                        height: 30,
                      ),
                    if (state is FileUploadDoneState)
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    if (state is ErrorFileUploadState)
                      InkWell(
                        onTap: () => bloc.add(UploadFileEvent(url: path)),
                        child: Icon(
                          Icons.refresh,
                          color: Colors.green,
                        ),
                      )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[300])),
              ),
            )
          ],
        );
      },
      cubit: bloc,
    );
  }

  _loadDocument() async {
    final result = await FilePicker.getFile();
    if (result != null) {
      bloc.add(UploadFileEvent(url: result.path));
      // ImageUploader uploader = ImageUploader();
      //  uploader.upload(result.path);
      path = result.path;
      appPrint(result.path);
    } else {
      // User canceled the picker
    }
  }
}
