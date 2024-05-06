// import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:news_weather_app_project/providers/app_provider.dart';
import 'package:news_weather_app_project/services/auth_service.dart';
import 'package:news_weather_app_project/widgets/input_text_field.dart';
import 'package:provider/provider.dart';
import 'package:news_weather_app_project/views/signup.dart';

import '../widgets/reset_pass_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isBiometric = false;
  Future<bool> Authenticate() async{
    final LocalAuthentication localAuth = LocalAuthentication();
    final bool isSupported = await localAuth.isDeviceSupported();
    final bool check = await localAuth.canCheckBiometrics;

    bool isAuth = false;
    if(isSupported && check){
      isAuth = await localAuth.authenticate(localizedReason: "complete biometrics to sign in anonymously");
    }
    return isAuth;
  }
  Future signIn() async {
    AuthService().signInWithEmailAndPassword(
        _emailController.text.trim().toLowerCase(),
        _passwordController.text.trim());
    Provider.of<AppProvider>(context,listen: false).signInAnonymous = false;
    Navigator.of(context).pushReplacementNamed("/");
  }

  void openSignupScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const SignUpScreen();
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
      backgroundColor: const Color(0xffffffff),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Align(
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: const Color(0xFF535D98),
                          borderRadius: BorderRadius.circular(16)),
                      height: 55,
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: openSignupScreen,
                      child: const Text(
                        ' Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff323A6B),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const PasswordReset();
                            });
                      },
                      child: const Text(
                        ' Forgot password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff323A6B),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () async {
                    isBiometric = await Authenticate();
                    if(isBiometric){
                      Provider.of<AppProvider>(context,listen: false).signInAnonymous = true;
                      Navigator.of(context).pushReplacementNamed("homeScreen");
                    }
                  },
                  child: const Text(
                    'Use Biometrics',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff323A6B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


