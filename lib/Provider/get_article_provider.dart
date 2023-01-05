

import 'package:flutter/cupertino.dart';
import 'package:geekin_assesment/Model/article_model.dart';
import 'package:geekin_assesment/services/api_services/article_services.dart';

class ArticleProvider with ChangeNotifier
{
  ArticleModel articleModel = ArticleModel();
  ArticleServices articleServices = ArticleServices();
  bool _loading = false;

  bool get loading => _loading;



  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String? filterName;

  String? get myFilterName => filterName;



  setFilterName(String? filter) {
    filterName = filter;
    notifyListeners();
  }


  ///Save Article Response in Provider

  ArticleModel? articleModelResponse;

  ArticleModel? get gettingResponse =>articleModelResponse;
  SaveArticleResponse(ArticleModel? response)
  {
    articleModelResponse = response;
    print("this is my new provider Calculated Response $articleModelResponse");
    notifyListeners();
  }

  getArticles(String? filterValue ,BuildContext context) async {

    setLoading(true);
    articleModel = (await articleServices.getArticles(filterValue))!;
    setLoading(false);
    print("VIEW MODEL ${articleModel!.response!.docs![0].byline!.original!}");
    return articleModel;

  }

}