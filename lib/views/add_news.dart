import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddNews extends StatefulWidget {
  const AddNews({super.key});

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String imgURL = '';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  Future addNews(String title, String description, String img) async {
    FirebaseFirestore.instance
        .collection('news')
        .add({'title': title, 'desc': description, 'imgURL': img});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Enter Details",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF323A69),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                    hintText: 'Title',
                    contentPadding: EdgeInsets.only(left: 8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                    hintText: 'Description',
                    contentPadding: EdgeInsets.only(left: 8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  String unique =
                      DateTime.now().microsecondsSinceEpoch.toString();

                  ImagePicker image = ImagePicker();
                  XFile? imageFile =
                      await image.pickImage(source: ImageSource.camera);
                  if (imageFile == null) return;
                  var refRoot = FirebaseStorage.instance.ref();
                  var refDir = refRoot.child('images');
                  var refImg = refDir.child(unique);
                  try {
                    await refImg.putFile(File(imageFile.path));
                    imgURL = await refImg.getDownloadURL();
                  } on Exception catch (e) {
                    Fluttertoast.showToast(msg: e.toString());
                  }
                },
                child: TextField(
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.camera_alt),
                      hintText: 'image',
                      enabled: false,
                      contentPadding: EdgeInsets.only(left: 8)),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await addNews(_titleController.text.trim(),
                    _descriptionController.text.trim(), imgURL);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Add",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
