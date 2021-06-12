import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MProfessionalInfo.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class SkillView extends StatefulWidget {
  final List<MSkill> skills;
  const SkillView({Key key, this.skills}) : super(key: key);

  @override
  _SkillViewState createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              title: "Skills",
              fontSize: AppFont.title3,
            ),
            ..._createSkills(),
            if (widget.skills.length < 5)
              IconButton(
                  icon: Icon(Icons.add_circle), onPressed: () => _addPress())
          ],
        ));
  }

  _createSkills() {
    return widget.skills
        .asMap()
        .map((i, e) => MapEntry(
              i,
              SkillRow(
                addPress: _removePress,
                index: i,
                skill: e,
              ),
            ))
        .values
        .toList();
  }

  _addPress() {
    this.setState(() {
      widget.skills.add(MSkill());
    });
  }

  _removePress(int index) {
    if (index == 0) return;
    this.setState(() {
      widget.skills.removeAt(index);
    });
  }
}

class SkillRow extends StatelessWidget {
  final Function addPress;
  final int index;
  final MSkill skill;
  const SkillRow({Key key, this.addPress, this.index, this.skill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: AppTextField(
            onChange: (v) {
              skill.skillName = v;
            },
          )),
          SizedBox(
            width: 20,
          ),
          Expanded(child: AppTextField(
            onChange: (v) {
              skill.exp = v;
            },
          )),
          IconButton(
              icon: Icon(Icons.close_rounded), onPressed: () => addPress(index))
        ],
      ),
    );
  }
}
