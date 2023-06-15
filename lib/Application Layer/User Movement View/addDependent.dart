import 'package:flutter/material.dart';

import 'addCheckInDetails.dart';

class MyCheckBox extends StatefulWidget {
  MyCheckBox({
    Key? key,
  }) : super(key: key);
  //final String title;
  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool _checkbox = false;
  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      body: Center(
        child: Column(
          children: [
            const Text(
              "\n\nI want to check-in with..\n",
              style: TextStyle(fontSize: 20),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Ahmad bin Abu'),
              value: _checkboxListTile1,
              onChanged: (value) {
                setState(() {
                  _checkboxListTile1 = !_checkboxListTile1;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Farah binti Abu'),
              value: _checkboxListTile2,
              onChanged: (value) {
                setState(() {
                  _checkboxListTile2 = !_checkboxListTile2;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class DependentPage extends StatefulWidget {
  const DependentPage({Key? key}) : super(key: key);

  @override
  State<DependentPage> createState() => _DependentPageState();
}

class _DependentPageState extends State<DependentPage> {
  //refresh when pop
  onGoBack(dynamic value) {
    setState(() {
      initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Check-In With My Dependents'),
          backgroundColor: Colors.deepOrange[200],
        ),
        bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            alignment: const FractionalOffset(1.0, 0.3),
            children: [
              Container(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrangeAccent)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddDetailDependentPage()),
                    ).then(onGoBack);
                  },
                  child: const Text('CONFIRM'),
                ),
              ),
            ]),
        body: MyCheckBox(),
      ),
    );
  }
}
