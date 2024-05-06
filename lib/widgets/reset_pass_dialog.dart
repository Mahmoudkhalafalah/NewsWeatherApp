import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      Navigator.of(context).pop();
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      backgroundColor: Color(0xFF535D98),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              "Enter Your Email",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: 'example',
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.only(left: 8)),
              style: TextStyle(color: Colors.white),
            ),
            GestureDetector(
              child: Text(
                'Close',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
                onPressed: () {
                  passwordReset();
                },
                child: Text(
                  "send",
                  style: TextStyle(fontSize: 16),
                )),
          ],
        ),
      ),
    );
  }
}