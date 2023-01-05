import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_text/link_text.dart';

import '../../utils/text_style.dart';


class BookWidget extends StatefulWidget {
  String? listName;
  String? publishDate;
  String? title;
  String? description;
  String? author;
  String? buyLink;
  String? bookImage;
   BookWidget({required this.listName , required this.publishDate, required this.title ,required this.description ,required this.author , required this.buyLink , required this.bookImage ,Key? key}) : super(key: key);

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("List Name:     ", style: TextStyling.blackTwentyTwoTextStyleBold ,),

              SizedBox(
                  width: 150.w,
                  child: Text(widget.listName.toString(), style: TextStyling.blackTwentyTwo,)),
            ],
          ),
          SizedBox(height: 7.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Publish Date: ", style: TextStyling.blackTwentyTwoTextStyleBold ,),

              SizedBox(
                  width: 150.w,
                  child: Text(widget.publishDate.toString(), style: TextStyling.blackTwentyTwo,)),
            ],
          ),
          SizedBox(height: 7.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title:                ", style: TextStyling.blackTwentyTwoTextStyleBold ,),

              SizedBox(
                  width: 250.w,
                  child: Text(widget.title.toString(), style: TextStyling.blackTwentyTwo,)),
            ],
          ),
          SizedBox(height: 7.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description:   ", style: TextStyling.blackTwentyTwoTextStyleBold ,),

              SizedBox(
                  width: 250.w,
                  child: Text(widget.description.toString(), style: TextStyling.blackTwentyTwo,)),
            ],
          ),
          SizedBox(height: 7.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Auhtor Name:", style: TextStyling.blackTwentyTwoTextStyleBold ,),

              SizedBox(
                  width: 150.w,
                  child: Text(widget.author.toString(), style: TextStyling.blackTwentyTwo,)),
            ],
          ),
          SizedBox(height: 7.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Buy Link:         ", style: TextStyling.blackTwentyTwoTextStyleBold ,),

              SizedBox(
                  width: 250.w,
                  child: LinkText(
                    widget.buyLink.toString(),
                    textAlign: TextAlign.center,
                  )
              ),
            ],
          ),
          SizedBox(height: 7.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Book Image:", style: TextStyling.blackTwentyTwoTextStyleBold ,),

              Container(
                  width: 250.w,
                  height: 250.h,

                  child: Image.network(widget.bookImage.toString(),)),
            ],
          ),
        ],
      ),
    );
  }
}

