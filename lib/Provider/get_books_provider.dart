

import 'package:flutter/cupertino.dart';
import 'package:geekin_assesment/Model/article_model.dart';
import 'package:geekin_assesment/services/api_services/article_services.dart';

import '../Models/book_model.dart';
import '../services/api_services/books_services.dart';

class BookProvider with ChangeNotifier
{
  BookModel bookModel = BookModel();
  BooksServices booksServices = BooksServices();
  bool _loading = false;

  bool get loading => _loading;



  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }







  ///Save Article Response in Provider

  BookModel? bookModelResponse;

  BookModel? get gettingResponse =>bookModelResponse;
  SaveBooksResponse(BookModel? response)
  {
    bookModelResponse = response;
    print("this is my new provider Calculated Response $bookModelResponse");
    notifyListeners();
  }

  getBooks(String? date ,BuildContext context) async {

    setLoading(true);
    bookModel = (await booksServices.getBooks(date))!;
    setLoading(false);
   // print("VIEW MODEL ${bookModel!.response!.docs![0].byline!.original!}");
    return bookModel;

  }

}