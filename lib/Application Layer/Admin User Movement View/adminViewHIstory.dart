import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../User Movement View/movementHistory.dart';

class AdminViewHistory extends StatefulWidget {
  const AdminViewHistory({Key? key}) : super(key: key);

  @override
  State<AdminViewHistory> createState() => _AdminViewHistoryState();
}

class _AdminViewHistoryState extends State<AdminViewHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange[200],
        title: const Text('Check-In'),
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
                      builder: (context) => const MovementHistoryPage()),
                );
              },
              child: const Text('View User Movement History')
            ),
          ),
          
        ],
      ),
      
    ));
  }
}