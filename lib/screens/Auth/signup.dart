import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekin_assesment/screens/Auth/login.dart';

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

class SignupScreen extends StatefulWidget {
  const SignupScreen ({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var dbHelper;
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode idFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    String uid = _idController.text;
    String uname = _nameController.text;
    String email = _emailController.text;
    String passwd = _passwordController.text;
    String cpasswd = _confirmPasswordController.text;

    if (_formKey.currentState!.validate()) {
      if (passwd != cpasswd) {
        Utils.toastMessage('Password Mismatch');
      } else {
        _formKey.currentState!.save();

        UserModel uModel = UserModel(uid, uname, email, passwd);
        await dbHelper.saveData(uModel).then((userData) {
          Utils.toastMessage("Successfully Saved");

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginScreen()));
        }).catchError((error) {
          print(error);
          Utils.toastMessage("Error: Data Save Fail");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            icon: Icons.arrow_back,
            title: "Register As User",
          )),
      body: SingleChildScrollView(
        child: Column(
          children:   [
            SizedBox(
              height: 70.h,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    AppImagesPath.appLogo,
                    height: 158.43.h,
                    width: 180.0.w,

                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Geekin Assessment",
                    style: TextStyling.logoTitleTs,
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "ID",
                                style: TextStyling.fieldTitleTs,
                              )),
                          const RequiredStar(),
                        ],
                      ),
                      InputTextField(
                        focusNode: idFocusNode,
                        textInputType: TextInputType.name,
                        needBorder: false,
                        controller: _idController,
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context, idFocusNode, nameFocusNode);
                        },
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))
                        // ],
                        hintText: 'User ID',
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "ID is required";
                          }
                        },
                      ),
                      const CustomSizedBox(),
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Name",
                                style: TextStyling.fieldTitleTs,
                              )),
                          const RequiredStar(),
                        ],
                      ),
                      InputTextField(
                        focusNode: nameFocusNode,
                        textInputType: TextInputType.name,
                        needBorder: false,
                        controller: _nameController,
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context, nameFocusNode, emailFocusNode);
                        },
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))
                        // ],
                        hintText: 'Name',
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Name is required";
                          }
                        },
                      ),
                      const CustomSizedBox(),
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email",
                                style: TextStyling.fieldTitleTs,
                              )),
                          const RequiredStar(),
                        ],
                      ),
                      InputTextField(
                        focusNode: emailFocusNode,
                        textInputType: TextInputType.emailAddress,
                        needBorder: false,
                        controller: _emailController,
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context, emailFocusNode, passwordFocusNode);
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))
                        ],
                        hintText: 'Email',
                        validator: (val) {
                          if (Utils.validateEmail(val)) {
                            return null;
                          } else {
                            return "Email is required";
                          }
                        },
                      ),
                      const CustomSizedBox(),
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Password",
                                style: TextStyling.fieldTitleTs,
                              )),
                          const RequiredStar()
                        ],
                      ),
                      PasswordInputField(
                        focusNode: passwordFocusNode,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Password is required";
                          }
                        },
                        textInputType: TextInputType.text,
                        needBorder: false,
                        controller: _passwordController,
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context, passwordFocusNode, confirmPasswordFocusNode);
                        },
                        hintText: "Password",
                      ),
                      const CustomSizedBox(),
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Confirm Password",
                                style: TextStyling.fieldTitleTs,
                              )),
                          const RequiredStar()
                        ],
                      ),
                      PasswordInputField(
                        focusNode: confirmPasswordFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm Password is required";
                          } if(value != _passwordController.text) {
                            return 'Not Match';
                          }
                          else
                          {
                            return null;
                          }
                        },
                        textInputType: TextInputType.text,
                        needBorder: false,
                        controller: _confirmPasswordController,
                        // onFieldSubmitted: (value) {
                        //   Utils.fieldFocusChange(context,
                        //       passwordFocusNode, confirmPasswordFocusNode);
                        // },
                        hintText: "Confirm Password",
                      ),
                      const CustomSizedBox(),
                      InkWell(
                          onTap: () async {



                            if (_formKey.currentState!.validate()){
                              signUp();
                            }
                            else {
                              Utils.snackBar("Form is invalid", context);
                            }
                          },
                          child: CustomButton(color: AppColors.buttonColor, text: "Register")),
                      const CustomSizedBox(),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyling.blackSixteenTextStyle,
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                              },
                              text: 'Login',
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
            )
          ],
        ),
      ),
    ));
  }
}
