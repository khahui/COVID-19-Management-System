import 'package:CoughIDSystem/Application%20Layer/Actor%20View/actorQuarantineRecord.dart';
import 'package:flutter/material.dart';
import 'Application Layer/Actor View/actorInformation.dart';
import 'Application Layer/Actor View/actorLogin.dart';
import 'Application Layer/Actor View/actorUserMovement.dart';
import 'Application Layer/Actor View/actorVaccination.dart';
import 'Application Layer/MOH Staff User Movement View/searchContactTracing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

//create choose actor page for user, Admin and MOH Staff
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Page'),
          backgroundColor: Colors.deepOrange[200],
        ),
        body: ListView(children: [
          const SizedBox(
            height: 30,
          ),
          Column(children: <Widget>[
            Image.asset(
              'assets/images/coughID_logo.png',
              height: 200,
              width: 200,
            ),
            Row(children: [
              Card(
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(30, 20, 130, 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrangeAccent)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActorLogin()),
                    );
                  },
                  child: const Text('  LOGIN  '),
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(15, 20, 10, 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrangeAccent)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActorUserMovement()),
                    );
                  },
                  child: const Text(' CHECK IN '),
                ),
              )
            ]),
            Row(
              children: [
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.fromLTRB(30, 20, 10, 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrangeAccent)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ActorVaccination()),
                      );
                    },
                    child: const Text('VACCINATION'),
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.fromLTRB(30, 20, 10, 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrangeAccent)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ActorQuarantineRecord()),
                      );
                    },
                    child: const Text('QUARANTINE RECORD'),
                  ),
                ),
              ],
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.fromLTRB(20, 20, 10, 20),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrangeAccent)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActorInformation()),
                  );
                },
                child: const Text('      INFORMATION      '),
              ),
            ),
          ])
        ]));
  }
}
