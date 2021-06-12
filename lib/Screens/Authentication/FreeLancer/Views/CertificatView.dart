import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MProfessionalInfo.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class CertificatView extends StatefulWidget {
  final List<MCertification> certificates;

  const CertificatView({Key key, this.certificates}) : super(key: key);

  @override
  _CertificatViewState createState() => _CertificatViewState();
}

class _CertificatViewState extends State<CertificatView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            padding: EdgeInsets.only(top: 20),
            title: "Certification",
            fontSize: AppFont.title4,
            fontWeight: AppFont.bold,
          ),
          ..._createView(),
          AppRoundButton(
            title: "addMore",
            isRightIcon: false,
            backgroundColor: Colors.white,
            borderColor: AppColors.greyBorder,
            titleColor: Colors.black,
            isBorder: true,
            onPressed: () => _addMore(),
          ),
        ],
      ),
    );
  }

  _createView() {
    return widget.certificates
        .asMap()
        .map((i, e) => MapEntry(
              i,
              CertificateRow(
                addMore: this._addMore,
                remove: this._remove,
                certificate: e,
                index: i,
              ),
            ))
        .values
        .toList();
  }

  _addMore() {
    this.setState(() {
      widget.certificates.add(MCertification());
    });
  }

  _remove(int index) {
    this.setState(() {
      widget.certificates.removeAt(index);
    });
  }
}

class CertificateRow extends StatelessWidget {
  final MCertification certificate;
  final Function addMore;
  final Function remove;
  final int index;
  const CertificateRow(
      {Key key, this.index, this.remove, this.addMore, this.certificate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                AppDropdown(
                  top: 30,
                  data: ["Award one"],
                  valueCallBack: (v, i) {
                    certificate.award = v;
                  },
                ),
                AppTextField(
                  hintText: "Certified From",
                  topMargin: 10,
                  onChange: (v) {
                    certificate.crtifiedFrom = v;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppDropdown(
                        data: years,
                        top: 10,
                        valueCallBack: (v, i) {
                          certificate.year = int.parse(v);
                        },
                      ),
                    ),
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 10.0),
                    //     child: AppRoundButton(
                    //       title: "addMore",
                    //       isRightIcon: false,
                    //       backgroundColor: Colors.white,
                    //       borderColor: AppColors.greyBorder,
                    //       isBorder: true,
                    //       titleColor: Colors.black,
                    //       onPressed: () => this.addMore(),
                    //     ),
                    //   ),
                    //   flex: 1,
                    // )
                  ],
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(icon: Icon(Icons.close), onPressed: () => remove(index))
          ],
        )
      ],
    );
  }
}
