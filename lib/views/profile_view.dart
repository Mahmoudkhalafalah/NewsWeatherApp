import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import '../services/auth_service.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool signIn = Provider.of<AppProvider>(context).signInAnonymous;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: FloatingActionButton(
          elevation: 8,
          onPressed: () {
            Provider.of<AppProvider>(context, listen: false).selectedIndex =
            0;
            if (!signIn) {
              AuthService().signOut();
            } else {
              Navigator.of(context).pushReplacementNamed("loginScreen");
            }
          },
          backgroundColor: const Color(0xFF323A69),
          child: const Icon(Icons.output_rounded),
        ),
      ),
      body: FutureBuilder(
        future: AuthService().getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return displayUserInformation(context, snapshot);
          } else {
            return const CircularProgressIndicator();
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Email: ${user?.email ?? 'Anonymous'}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Created: ${DateFormat('MM/dd/yyyy').format(user?.metadata?.creationTime ?? DateTime.timestamp())}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
