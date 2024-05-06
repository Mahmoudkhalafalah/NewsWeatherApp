import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/auth_service.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: FloatingActionButton(
          elevation: 8,
          onPressed: () {
            AuthService().signOut();
          },
          backgroundColor: Color(0xFF323A69),
          child: Icon(Icons.output_rounded),
        ),
      ),
      body: FutureBuilder(
        future: AuthService().getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return displayUserInformation(context, snapshot);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Widget displayUserInformation(context, snapshot) {
  final user = snapshot.data;

  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 0.4 * MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFF323A69),
              Color(0xff323A6B),
              Color(0xFF374270),
              Color(0xFF3E4977),
              Color(0xFF4F598A),
              Color(0xFF525D93),
              Color(0xFF535D98),
            ])),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Email: ${user.email ?? 'Anonymous'}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Created: ${DateFormat('MM/dd/yyyy').format(user.metadata.creationTime)}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
