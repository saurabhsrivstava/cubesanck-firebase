import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class AppUnderLineTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  final String hintText;
  final String labelText;
  final bool isLocalised;
  final bool enable;
  final bool obscureText;
  const AppUnderLineTextField(
      {Key key,
      this.controller,
      this.onChanged,
      this.hintText,
      this.labelText,
      this.isLocalised,
      this.enable = true, this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: this.controller,
      onChanged: (v) => this.onChanged(v),
      decoration: new InputDecoration(
          enabled: enable,
          hintText: this.hintText,
          labelText: labelText,
          labelStyle: new TextStyle(color: AppColors.grey500)),
    );
  }
}
