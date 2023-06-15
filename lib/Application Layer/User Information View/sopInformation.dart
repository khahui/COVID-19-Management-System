import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class InformationSOPs extends StatefulWidget {
  const InformationSOPs({Key? key}) : super(key: key);

  @override
  State<InformationSOPs> createState() => _InformationSOPsState();
}

class _InformationSOPsState extends State<InformationSOPs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Covid-19 SOPs'),
          backgroundColor: Colors.deepOrange[200],
        ),
        body: ListView(children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            children: <Widget>[
              Image.asset(
                'assets/images/sop.jpg',
                height: 800,
                width: 400,
              ),
              Image.asset(
                'assets/images/quarantine.jpg',
                height: 800,
                width: 400,
              ),
            ],
          ),
        ]));
  }
}
