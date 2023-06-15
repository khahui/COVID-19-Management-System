import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../User Information View/UserViewInformation.dart';
import '../Admin Information View/addInformation.dart';
import '../Admin Information View/updateInformation.dart';

//create homepage for admin and user
class viewInformation extends StatelessWidget {
  const viewInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Information'),
        backgroundColor: Colors.deepOrange[200],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrangeAccent)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const addInformation()),
                );
              },
              child: const Text('Add Information'),
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrangeAccent)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const updateInformation()),
                );
              },
              child: const Text('List of Information'),
            ),
          ),
        ],
      ),
    );
  }
}
