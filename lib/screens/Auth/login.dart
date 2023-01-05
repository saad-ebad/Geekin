import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geekin_assesment/screens/Auth/signup.dart';
import 'package:geekin_assesment/screens/Home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../DatabaseHandler/db_helper.dart';
import '../../Models/user_model.dart';
import '../../Resource/app_colors.dart';
import '../../Resource/my_widgets/input_text_field.dart';
import '../../resource/app_images_path.dart';
import '../../resource/my_widgets/custom_app_bar.dart';
import '../../resource/my_widgets/custom_button.dart';
import '../../resource/my_widgets/password_text_field.dart';
import '../../resource/my_widgets/red_star_required.dart';
import '../../routes/routes_name.dart';
import '../../utils/text_style.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userIDController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  FocusNode idFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  final requiredValidator = RequiredValidator(errorText: 'this field is required');
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  var dbHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uid = _userIDController.text;
    String passwd = _passwordController.text;

    if (uid.isEmpty) {
      Utils.toastMessage("Please Enter User ID");
    } else if (passwd.isEmpty) {
      Utils.toastMessage("Please Enter Password");
    } else {
      await dbHelper.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
                    (Route<dynamic> route) => false);
          });
        } else {
          Utils.toastMessage("Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        Utils.toastMessage("Error: Login Fail");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_id", user.user_id!);
    sp.setString("email", user.email!);
    sp.setString("password", user.password!);
  }


  @override
  Widget build(BuildContext context) {
    num height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: CustomAppBar(icon: Icons.arrow_back,title: "Login",)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height*.1,),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      AppImagesPath.appLogo,
                      height: 158.43.h,
                      width: 180.0.w,

                    ),
                    SizedBox(height: height*.004,),
                    Text("Geekin Assessment", style: TextStyling.logoTitleTs,),
                    SizedBox(height: height* .09,),
                  ],
                ),
              ),
              SizedBox(height: height*.035,),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.w , right: 12.w),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child:  Text("User ID" ,style: TextStyling.fieldTitleTs, )),

                          ),
                          RequiredStar(),
                        ],
                      ),

                      Padding(
                        padding: Utils.paddingTwelve,
                        child: InputTextField(
                          focusNode: idFocusNode,
                          textInputType: TextInputType.emailAddress,
                          needBorder: false,
                          controller: _userIDController,
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(context,
                                idFocusNode, passwordFocusNode);
                          },

                          hintText: 'User ID',
                          validator: (val) {
                            if (Utils.validateEmail(val)) {
                              return null;
                            } else {
                              return "User ID is required";
                            }
                          },
                        ),
                      ),

                       SizedBox(height: 12.h),
                      Row(
                        children: [
                          Padding(
                            padding: Utils.paddingTwelve,
                            child: Align(
                                alignment: Alignment.topLeft,
                                child:  Text("Password" ,style: TextStyling.fieldTitleTs, )),
                          ),
                          RequiredStar()
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(
                            left: 12.0.w, right: 12.0.w),
                        child: PasswordInputField(
                          focusNode: passwordFocusNode,
                          validator: requiredValidator,
                          textInputType: TextInputType.text,
                          needBorder: false,
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      Padding(
                        padding: Utils.paddingTwelve,
                        child: GestureDetector(
                            onTap: () async {
                              login();
                            },
                            child: CustomButton(text: "Login", color: AppColors.buttonColor,)),
                      ),
                       SizedBox(
                        height: 20.h,
                      ),


                    ],
                  )),

              SizedBox(height: 70.h,),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Don't have an account?",
                      style: TextStyling.blackSixteenTextStyle,
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
                        },
                      text: 'Sign Up',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
