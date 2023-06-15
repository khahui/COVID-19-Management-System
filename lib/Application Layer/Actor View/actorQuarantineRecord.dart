import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:testaapril/Application%20Layer/Admin%20View/IndexMOHStaff.dart';

import '../MOH Staff User Quarantine Record View/indexMOHStaff.dart';
import '../User Quarantine Record View/indexUser.dart';

// import 'Application Layer/User View/Index User.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: ActorQuarantineRecord(),
  ));
}

//create homepage for admin and user
class ActorQuarantineRecord extends StatelessWidget {
  const ActorQuarantineRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      builder: (context) => const IndexAdminPage()),
                );
              },
              child: const Text('MOH Staff'),
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
                      builder: (context) => const IndexUserPage()),
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
