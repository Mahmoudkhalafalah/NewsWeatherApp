import 'package:flutter/material.dart';

class Search_View_Page extends StatelessWidget {
  const Search_View_Page ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Search a city' ,
         style: TextStyle(
           color: Colors.white,
         ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter a city',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (){},
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}