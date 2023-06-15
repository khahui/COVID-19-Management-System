import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Admin Information View/viewInformation.dart';
import '../User Information View/UserViewInformation.dart';

class ActorInformation extends StatelessWidget {
  const ActorInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select Actor'),
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
                      builder: (context) => const viewInformation()),
                );
              },
              child: const Text('Admin'),
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
                      builder: (context) => const userViewInformation()),
                );
              },
              child: const Text('User'),
            ),
          ),
        ],
      ),
    );
  }
}
