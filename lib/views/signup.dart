import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_weather_app_project/services/auth_service.dart';
import 'package:news_weather_app_project/views/login.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/input_text_field.dart';
import 'home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future signUp() async {
    AuthService().signUp(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _confirmPasswordController.text.trim());
    Navigator.of(context).pushReplacementNamed("loginScreen");
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void openSignInScreen() {
    Navigator.of(context).pushReplacementNamed("loginScreen");
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool passVisibility =
        Provider.of<AppProvider>(context).signUpPassWordVisible;
    Icon passIcon = Provider.of<AppProvider>(context).signUpPasswordFieldIcon;
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
                  hint: "Password",
                  visibility: passVisibility,
                  icon: passIcon,
                  onPress: () {
                    Provider.of<AppProvider>(context, listen: false)
                        .changeSignUpPassVisibility();
                  },
                ),
                PasswordCustomTextField(
                  controller: _confirmPasswordController,
                  hint: "Confirm password",
                  visibility: passVisibility,
                  icon: passIcon,
                  onPress: () {
                    Provider.of<AppProvider>(context, listen: false)
                        .changeSignUpPassVisibility();
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color(0xFF535D98),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          "Sign Up",
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
                      "already have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: openSignInScreen,
                      child: Text(
                        ' Sign in',
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
