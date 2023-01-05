import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekin_assesment/screens/Auth/login.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Provider/get_article_provider.dart';
import '../../Provider/get_books_provider.dart';
import '../../Provider/tab_index.dart';
import '../../Resource/app_colors.dart';
import '../../Resource/my_widgets/input_text_field.dart';
import '../../resource/app_images_path.dart';
import '../../resource/my_widgets/custom_app_bar.dart';
import '../../resource/my_widgets/custom_button.dart';
import '../../resource/my_widgets/filters_button.dart';
import '../../utils/text_style.dart';
import '../../utils/utils.dart';
import '../Auth/signup.dart';
import 'article_search.dart';
import 'books_search.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({Key? key}) : super(key: key);

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  TextEditingController searchController = TextEditingController();
  late TextEditingController dateOfOriginationController;
  TextEditingController addressController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  bool? loading;

  final List<Tab> myTabs =  <Tab>[

    Tab(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 24.h,

              child:   Image.asset(
                AppImagesPath.appLogo,
                height: 158.43,
                width: 180.0,

              ),
            ),

            SizedBox(height: 4.h,),

            Text("Articles" , style: TextStyling.appBarTextStyle ,),

          ],
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 24.h,

              child: Image.asset(

                AppImagesPath.bookings,
                height: 38.h,
                width: 38.w,
                // color: bottomProvider.currentIndex == 1 ?  AppColors.buttonColor : AppColors.textFieldColor,

              ),
            ),

            SizedBox(height: 4.h,),

            Text("Books" , style: TextStyling.appBarTextStyle,),

          ],
        ),
      ),
    ),









  ];

  late TabController _tabController;

  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    dateOfOriginationController = TextEditingController();
    _tabController = TabController(
        vsync: this, length: myTabs.length, initialIndex: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<ArticleProvider>(context);
    var height =MediaQuery.of(context).size.height*1;
    var width =MediaQuery.of(context).size.width*1;
    var tabIndex =Provider.of<GetIndex>(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: (){
                    print("Tapped");
                    showFilterSheet(context);
                  },
                  child: Icon(

                    color: AppColors.blackColor ,
                    Icons.account_tree,
                    size: 28.0,
                  ),
                ),
              )
          ),
        ],
        bottom: TabBar(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              tabIndex.saveIndex(_selectedIndex);
              print("Tapped ${_selectedIndex}");
            });
          },
          controller: _tabController,
          tabs: myTabs,

          isScrollable: true,
          labelColor: AppColors.blackColor,
          unselectedLabelColor: AppColors.buttonColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.transparent,


        ),
        title:  Text('Search', style: TextStyling.blackTwentyTwoTextStyleBold,),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,
      ),


   
        body:  TabBarView(
          physics: BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          controller: _tabController,
          children:  [
          Provider.of<ArticleProvider>(context).loading ?  Center(
            child: CircularProgressIndicator(),
          ) : ArticleSearch(),
            BestSellerBooks(date: dateOfOriginationController.text),


          ],

        ),


    ));

  }
  void showFilterSheet(context)  {

    var index = Provider.of<GetIndex>(context, listen: false);
    //var articleProvider = Provider.of<ArticleProvider>(context, listen: false);
    showModalBottomSheet (
        context: context,
        builder: (BuildContext bc) {


          return index.index == 0 ?  Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              height: 150.h,
              width: 150.w,
              child: Column(
                children: [
                  Text("Filters" , style: TextStyling.blackTwentyTwoTextStyleBold,),
                  SizedBox(height: 33.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async{
                          //articleProvider.getArticles(searchController.text.isEmpty?  'body' : searchController.text, context);

                          Provider.of<ArticleProvider>(context, listen: false).setFilterName("Body");
                           await Provider.of<ArticleProvider>(context, listen: false).getArticles(searchController.text.isEmpty?  'body' : searchController.text, context);
                            Provider.of<ArticleProvider>(context, listen: false).SaveArticleResponse(Provider.of<ArticleProvider>(context, listen: false).articleModel); // Prints after 1 second.


                          //articleProvider.articleModel.response?.docs?[0].byline?.original.toString();
                          print("Tapped");
                        },
                          child: FilterButton(color: AppColors.gradientFilterColor,text: "Body")),
                      GestureDetector(
                        onTap: () async{
                          Provider.of<ArticleProvider>(context, listen: false).setFilterName("Headline");
                          await Provider.of<ArticleProvider>(context, listen: false).getArticles(searchController.text.isEmpty?  'headline' : searchController.text, context);
                          Provider.of<ArticleProvider>(context, listen: false).SaveArticleResponse(Provider.of<ArticleProvider>(context, listen: false).articleModel); // Prints after 1 second.




                        },
                          child: FilterButton(color: AppColors.gradientFilterColor,text: "Headline",)),
                      GestureDetector(
                        onTap: () async{
                          Provider.of<ArticleProvider>(context, listen: false).setFilterName("Subject");
                          await Provider.of<ArticleProvider>(context, listen: false).getArticles(searchController.text.isEmpty?  'subject' : searchController.text, context);
                          Provider.of<ArticleProvider>(context, listen: false).SaveArticleResponse(Provider.of<ArticleProvider>(context, listen: false).articleModel); // Prints after 1 second.


                        },
                          child: FilterButton(color: AppColors.gradientFilterColor,text: "Subject",))

                    ],
                  ),
                ],
              ),
            ),
          ) : SizedBox(
            height: 150.h,
            width: 150.w,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text("Filter By Date" , style: TextStyling.blackTwentyTwoTextStyleBold,),
                  SizedBox(height: 33.h,),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: AppColors.textFieldColor,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Date of Origination is required";
                          }
                        },
                        controller: dateOfOriginationController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            ),
                            hintText: 'Date of Origination'),
                        onTap: () async {
                          FocusScope.of(context)
                              .requestFocus(new FocusNode());
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                            confirmText: "Done",
                            initialEntryMode:
                            DatePickerEntryMode.calendarOnly,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    onBackground: Color(0xffE5E5E5),
                                    primary: AppColors.buttonColor,
                                    onSurface: Color(0xff333333),
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        // button text color
                                        backgroundColor:
                                        AppColors.buttonColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                13))),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                dateOfOriginationController.text =
                                    DateFormat("yyyy-MM-dd")
                                        .format(value);


                                print(
                                    '${dateOfOriginationController.text}');
                              });
                            }
                          });
                          Provider.of<BookProvider>(context, listen: false).getBooks(dateOfOriginationController.text , context);
                          Provider.of<BookProvider>(context, listen: false).SaveBooksResponse(Provider.of<BookProvider>(context, listen: false).bookModel);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}


