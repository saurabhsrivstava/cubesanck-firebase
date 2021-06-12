import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Localisation.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String title;

  final TextAlign textAlign;
  final EdgeInsets padding;
  final int maxLines;
  final bool isLocalised;
  final TextDecoration decoration;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;

  const AppTitle(
      {Key key,
      @required this.title,
      this.textAlign = TextAlign.center,
      this.padding = EdgeInsets.zero,
      this.maxLines,
      this.isLocalised = false,
      this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.decoration = TextDecoration.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        isLocalised
            ? AppLocalizations.of(context).translate(title)
            : title ?? '',
        maxLines: maxLines,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: TextStyle(
            decoration: decoration,
            fontWeight: fontWeight,
            fontFamily: AppFont.proximaNova,
            fontSize: fontSize,
            color: color),
      ),
    );
  }
}
