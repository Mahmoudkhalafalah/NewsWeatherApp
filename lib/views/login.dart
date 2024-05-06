// import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_weather_app_project/providers/app_provider.dart';
import 'package:news_weather_app_project/services/auth_service.dart';
import 'package:news_weather_app_project/widgets/input_text_field.dart';
import 'package:news_weather_app_project/widgets/reset_pass_dialog.dart';
import 'package:provider/provider.dart';
import 'package:news_weather_app_project/views/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signIn() async {
    AuthService().signInWithEmailAndPassword(
        _emailController.text.trim().toLowerCase(),
        _passwordController.text.trim());
    Navigator.of(context).pushReplacementNamed("/");
  }

  void openSignupScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return SignUpScreen();
      },
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool passVisibility =
        Provider.of<AppProvider>(context).loginPassWordVisible;
    Icon passIcon = Provider.of<AppProvider>(context).loginPasswordFieldIcon;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "BreezeBrief",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                      color: Color(0xFF535D98),
                    ),
                  ),
                ),
                CustomTextField(
                  controller: _emailController,
                  visibility: false,
                  hint: "Email address",
                ),
                PasswordCustomTextField(
                  controller: _passwordController,
                  hint: "password",
                  visibility: passVisibility,
                  icon: passIcon,
                  onPress: () {
                    Provider.of<AppProvider>(context, listen: false)
                        .changeLoginPassVisibility();
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color(0xFF535D98),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      height: 55,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: openSignupScreen,
                      child: Text(
                        ' Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff323A6B),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PasswordReset();
                            });
                      },
                      child: Text(
                        ' Forgot password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff323A6B),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


