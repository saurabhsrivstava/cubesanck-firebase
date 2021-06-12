import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MProfessionalInfo.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class EducationView extends StatefulWidget {
  final List<MEducation> educations;
  const EducationView({Key key, this.educations}) : super(key: key);

  @override
  _EducationViewState createState() => _EducationViewState();
}

class _EducationViewState extends State<EducationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "Education",
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
    return widget.educations
        .asMap()
        .map((i, e) => MapEntry(
              i,
              EducationRow(
                addMore: this._addMore,
                remove: this._remove,
                education: e,
                index: i,
              ),
            ))
        .values
        .toList();
  }

  _addMore() {
    this.setState(() {
      widget.educations.add(MEducation());
    });
  }

  _remove(int index) {
    this.setState(() {
      widget.educations.removeAt(index);
    });
  }
}

class EducationRow extends StatelessWidget {
  final MEducation education;
  final Function addMore;
  final Function remove;
  final int index;

  const EducationRow(
      {Key key, this.addMore, this.education, this.remove, this.index})
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
                  data: ["Country College one"],
                  valueCallBack: (v, i) {
                    education.country = v;
                  },
                ),
                AppTextField(
                  hintText: "College/University Name",
                  topMargin: 10,
                  onChange: (v) {
                    education.collegeName = v;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: AppDropdown(
                          data: ["Title", ""],
                          top: 10,
                          valueCallBack: (v, i) {
                            education.title = v;
                          },
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: AppTextField(
                        hintText: "Senior Designer",
                        topMargin: 10,
                        onChange: (v) {
                          education.post = v;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppDropdown(
                        data: years,
                        top: 10,
                        valueCallBack: (v, i) {
                          education.year = int.parse(v);
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
                    //       titleColor: Colors.black,
                    //       isBorder: true,
                    //       onPressed: () => addMore(),
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
