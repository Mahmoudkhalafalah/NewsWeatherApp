import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_weather_app_project/views/news_home_views.dart';

class UserNews extends StatefulWidget {
  const UserNews({super.key});
  @override
  State<UserNews> createState() => _UserNewsState();
}

class _UserNewsState extends State<UserNews> {
  List<String> docIDs = [];
  Future getDocId() async {
    if (docIDs.isEmpty) {
      await FirebaseFirestore.instance
          .collection('news')
          .get()
          .then((value) => value.docs.forEach((element) {
                docIDs.add(element.reference.id);
              }));
    }
  }

  CollectionReference news = FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: FutureBuilder(
                    future: getDocId(),
                    builder: (BuildContext context, snapshot) {
                      if (docIDs.isEmpty)
                        return Center(
                          child: Text(
                            'No reported News',
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                        );
                      return ListView.builder(
                        itemCount: docIDs.length,
                        itemBuilder: (context, index) {
                          return GetData(docID: docIDs[index]);
                        },
                      );
                    },
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

class GetData extends StatelessWidget {
  const GetData({super.key, required this.docID});
  final String docID;
  @override
  Widget build(BuildContext context) {
    CollectionReference news = FirebaseFirestore.instance.collection('news');
    return FutureBuilder(
        future: news.doc(docID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      '${data['imgURL']}',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    ListTile(
                      title: Text(
                        data['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(data['desc'] ?? ''),
                      onTap: () {
                        // Open article URL
                      },
                    ),
                  ],
                ),
              ),
            );
            ;
          } else
            return Text('loading');
        }));
  }
}
