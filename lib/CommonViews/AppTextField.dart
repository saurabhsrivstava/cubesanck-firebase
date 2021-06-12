import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/SellerValidator.dart';
import 'package:cubesnack/Utils/Localisation.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final double height;
  final double width;
  final Function onChange;
  final TextInputType keyBoardType;
  final String labelText;
  final double topMargin;
  final isRightIcon;
  final Widget rightIcon;
  final bool isLocalise;
  final bool obscureText;
  final String value;
  final bool enabled;
  final bool autofocus;
  const AppTextField(
      {Key key,
      this.hintText = '',
      this.topMargin = 0,
      this.controller,
      this.height = 45,
      this.width = double.infinity,
      this.onChange,
      this.keyBoardType = TextInputType.text,
      this.labelText,
      this.isRightIcon = false,
      this.rightIcon,
      this.isLocalise = false,
      this.obscureText = false,
      this.value,
      this.enabled = true,
      this.autofocus = false})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String isError;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          margin: EdgeInsets.only(top: widget.topMargin ?? 15),
          child: Material(
            elevation: 0.5,
            borderRadius: BorderRadius.circular(5.0),
            shadowColor: Colors.white,
            child: TextFormField(
              autofocus: this.widget.autofocus,
              enabled: this.widget.enabled,
              initialValue: this.widget.value,
              obscureText: widget.obscureText,
              onChanged: (v) => {
                this.widget.keyBoardType == TextInputType.emailAddress
                    ? this.setState(() {
                        isError = SellerValidator.validateEmail(v);
                      })
                    : null,
                this.widget.onChange != null ? this.widget.onChange(v) : null,
              },
              controller: widget.controller,
              keyboardType: widget.keyBoardType,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                suffixIcon: this.widget.rightIcon,
                contentPadding: // Text Field height
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                hintStyle: TextStyle(
                    height: 1, //Controls the height of the hint text
                    color: Colors.grey[400]),
                hintText: widget.isLocalise
                    ? AppLocalizations.of(context).translate(widget.hintText)
                    : widget.hintText,
                helperStyle: TextStyle(color: Colors.grey[300]),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey[300])),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(width: 0.5, color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
        if (isError != null && isError.length > 0)
          AppTitle(
            padding: EdgeInsets.only(top: 3),
            title: isError,
            color: Colors.red,
            textAlign: TextAlign.left,
          )
      ],
    );
  }
}
