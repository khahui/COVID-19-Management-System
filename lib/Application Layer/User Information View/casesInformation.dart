import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'userViewInformation.dart';

class InformationCases extends StatefulWidget {
  const InformationCases({Key? key}) : super(key: key);

  @override
  State<InformationCases> createState() => _InformationCasesState();
}

class _InformationCasesState extends State<InformationCases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Covid-19 Cases'),
          backgroundColor: Colors.deepOrange[200],
        ),
        body: ListView(children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            children: <Widget>[
              Image.asset(
                'assets/images/kes.jpg',
                height: 600,
                width: 500,
              )
            ],
          ),
        ]));
  }
}
