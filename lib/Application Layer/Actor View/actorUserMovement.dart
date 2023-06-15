import 'package:flutter/material.dart';

import '../Admin User Movement View/adminViewHIstory.dart';
import '../MOH Staff User Movement View/chooseOption.dart';
import '../MOH Staff User Movement View/searchContactTracing.dart';
import '../User Movement View/checkIn.dart';
import '../User Movement View/movementHistory.dart';

//Page user movement for choosing actors
class ActorUserMovement extends StatelessWidget {
  const ActorUserMovement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange[200],
        title: const Text('Select Actor'),
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
                  MaterialPageRoute(builder: (context) => const CheckInPage()),
                );
              },
              child: const Text('User'),
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
                      builder: (context) => const AdminViewHistory()),
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
                  MaterialPageRoute(builder: (context) => const ChooseOption()),
                );
              },
              child: const Text('MOH Staff'),
            ),
          ),
        ],
      ),
    ));
  }
}
