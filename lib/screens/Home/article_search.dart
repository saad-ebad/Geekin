import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Provider/get_article_provider.dart';
import '../../Resource/app_colors.dart';
import '../../resource/my_widgets/article_widget.dart';
import '../../resource/my_widgets/search_field.dart';
import '../../utils/text_style.dart';

class ArticleSearch extends StatefulWidget {
  String? filterSearchName;
   ArticleSearch({this.filterSearchName ,Key? key}) : super(key: key);

  @override
  State<ArticleSearch> createState() => _ArticleSearchState();
}

class _ArticleSearchState extends State<ArticleSearch> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<ArticleProvider>(context);

    return SafeArea(child: SingleChildScrollView(

      child:  Column(
      children: [
        SizedBox(height: 20.h,),
        provider.articleModel.status =="OK" ? Text("Search By ${Provider.of<ArticleProvider>(context, listen: false).filterName}",style: TextStyling.blackTwentyTwoTextStyleBold,): SizedBox(),

        SizedBox(height: 10.h,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child:  provider.articleModel.status =="OK" ?  SearchField(controller: searchController, needBorder: true , textInputType: TextInputType.text,hintText: 'Search', myDecoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 13.0),
            errorStyle: const TextStyle(

            ),
            suffixIcon: GestureDetector(
              onTap: () async{
                await Provider.of<ArticleProvider>(context, listen: false).getArticles(searchController.text.isEmpty?  'body' : searchController.text, context);
                Provider.of<ArticleProvider>(context, listen: false).SaveArticleResponse(Provider.of<ArticleProvider>(context, listen: false).articleModel);
              },
                child: Icon(Icons.search)),
            hintText: "Search",

            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textFieldHintColor,
            ),
          ),) : SizedBox(),
        ),

        provider.articleModel.status =="OK" ? 
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 600.h, minHeight: 56.0.h),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: provider.articleModel.response?.docs?.length,
              itemBuilder: (BuildContext context, int index){
              return  ArticleContent(original: provider.articleModelResponse!.response!.docs![index].byline!.original.toString() , abstract: provider.articleModelResponse!.response!.docs![index].docAbstract.toString(),leadParagraph: provider.articleModelResponse!.response!.docs![index].leadParagraph.toString()

               ,);
              }),
        ) : Center(child: Text("No Data Displayed, please select filter"),)

      ],
      ) ,
    ));
  }
}
