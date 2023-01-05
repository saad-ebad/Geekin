import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekin_assesment/utils/text_style.dart';
class ArticleContent extends StatefulWidget {
  String original;
  String abstract;
  String leadParagraph;
  List? images;
  ArticleContent({required this.original , required this.abstract, required this.leadParagraph, this.images ,Key? key}) : super(key: key);

  @override
  State<ArticleContent> createState() => _ArticleContentState();
}

class _ArticleContentState extends State<ArticleContent> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
      child: Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Author:   ", style: TextStyling.blackTwentyTwoTextStyleBold ,),

            SizedBox(
              width: 150.w,
                child: Text(widget.original, style: TextStyling.blackTwentyTwo,)),
          ],
        ),
       // SizedBox(height: 7.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Abstract:", style: TextStyling.blackTwentyTwoTextStyleBold ,),
           // SizedBox(width: 8.w,),
            SizedBox(
                width: 250.w,
                child: Text("${widget.abstract}", style: TextStyling.blackTwentyTwo,)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 90.w,
        child: Text("Leading Paragraph: ", style: TextStyling.blackTwentyTextStyleBold ,)),
            SizedBox(
              width: 250.w,
                child: Text("${widget.leadParagraph}", style: TextStyling.blackTwentyTwo,)),

          ],
        ),

       /* Container(
          child: MemoryImage(_image)
           *//* decoration: BoxDecoration(

                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(Provider.of<ArticleProvider>(context).articleModelResponse!.response!.docs![0].multimedia![1].url.toString()
                  ),
                ))*//*,

            height: 60.0, width: 60.0)*/




      ],
      ),
    );
  }
}
