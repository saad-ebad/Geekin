import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Provider/get_books_provider.dart';
import '../../resource/my_widgets/book_widget.dart';
import '../../utils/text_style.dart';

class BestSellerBooks extends StatefulWidget {
  String? date;
   BestSellerBooks({this.date , Key? key}) : super(key: key);

  @override
  State<BestSellerBooks> createState() => _BestSellerBooksState();
}

class _BestSellerBooksState extends State<BestSellerBooks> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

       Provider.of<BookProvider>(context, listen: false).getBooks(widget.date ?? "current", context);
       Provider.of<BookProvider>(context, listen: false).SaveBooksResponse(Provider.of<BookProvider>(context, listen: false).bookModel);
    });
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BookProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          Center(child: Text("Best Seller Books", style: TextStyling.blackTwentyTwoTextStyleBold,)),
          SizedBox(height: 10.h,),
          provider.bookModel.results?.listName.toString() == null  ? Center(
            child: CircularProgressIndicator(),
          ) :  ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 600.h, minHeight: 56.0.h),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: provider.bookModel.results?.books?.length,
                itemBuilder: (BuildContext context, int index){
                  return  BookWidget(listName: provider.bookModel.results?.listName.toString(), publishDate: provider.bookModel.results?.publishedDate.toString(), title: provider.bookModel.results?.books?[index].title.toString(), description: provider.bookModel.results?.books?[index].description.toString(), author: provider.bookModel.results?.books?[index].author.toString(), buyLink: provider.bookModel.results?.books?[index].buyLinks?[0].url.toString(), bookImage:  provider.bookModel.results?.books?[index].bookImage.toString());
                }),
          )
        ],
      ),
    );
  }
}
