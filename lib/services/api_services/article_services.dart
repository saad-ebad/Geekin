
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../Model/article_model.dart';
import '../../resource/app_url.dart';

class ArticleServices
{
   Future<ArticleModel?> getArticles(String? filterValue) async
   {
      ArticleModel articleModel = ArticleModel();
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
             AppUrl.getArticles, options: Options(headers: {
            "Accept": "application/json",
         },), queryParameters: {
            "q": filterValue,
            "api-key": AppUrl.apiKey,
         }).timeout(Duration(seconds: 10));
         if (response.statusCode == 200){
         articleModel = ArticleModel.fromJson(response.data);
      }
         else
            {
               print("Failed to Get Articles");
            }
         return articleModel;
      }
      on SocketException {

         throw('No Internet Connection');
      }

   }
}