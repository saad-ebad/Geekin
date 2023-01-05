
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../Model/article_model.dart';
import '../../Models/book_model.dart';
import '../../resource/app_url.dart';

class BooksServices
{
  Future<BookModel?> getBooks(String? date) async
  {
    BookModel bookModel = BookModel();
    Dio dio = Dio();
    var requestsLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      // compact: true,
      // maxWidth: 90,
    );
    dio.interceptors.add(
      requestsLogger,
    );


    try {
      var response = await dio.get(
          "https://api.nytimes.com/svc/books/v3/lists/$date/hardcover-fiction.json?api-key=KkdApbYLAnW9imR4w3j4uyIWOlYeNjea", options: Options(headers: {
        "Accept": "application/json",
      },), queryParameters: {
        "api-key": AppUrl.apiKey,
      });
      if (response.statusCode == 200){
        bookModel = BookModel.fromJson(response.data);
      }
      else
      {
        print("Failed to Get Articles");
      }
      return bookModel;
    }
    on SocketException {

      throw('No Internet Connection');
    }

  }
}