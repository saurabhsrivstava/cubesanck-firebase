
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MessageSellerView extends StatefulWidget {
  @override
  _MessageSellerViewState createState() => _MessageSellerViewState();
}

class _MessageSellerViewState extends State<MessageSellerView> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Image.asset(
                  'assets/images/close.png',
                  width: 30,
                  height: 30,
                ),
                backgroundColor: Colors.white,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.message_outlined,
                  size: 20,
                ),
                AppTitle(
                  title: "Message",
                  color: AppColors.blackLight,
                  padding: EdgeInsets.all(10),
                  fontSize: AppFont.title5,
                  fontWeight: AppFont.semiBold,
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Type your message here",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[200])),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.blue.withAlpha(20),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.send,
                    size: 50,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.attach_file,
                  color: Colors.grey[400],
                  size: 20,
                ),
                AppTitle(
                  title: "Attach File",
                  color: AppColors.blackLight,
                  padding: EdgeInsets.all(10),
                  fontSize: AppFont.title3,
                  fontWeight: AppFont.regular,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
