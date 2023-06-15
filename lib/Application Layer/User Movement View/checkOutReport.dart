import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Services Layer/User Movement Controller/userMovement_bloc.dart';
import 'addCheckInDetails.dart';
import 'viewHistory.dart';

class CheckOutReport extends StatefulWidget {
  const CheckOutReport({Key? key}) : super(key: key);

  @override
  State<CheckOutReport> createState() => _CheckOutReportState();
}

class _CheckOutReportState extends State<CheckOutReport> {
  final UserBloc userBloc = UserBloc();

  //get data when initial this state
  @override
  void initState() {
    userBloc.add(GetUserList());
    super.initState();
  }

  refresh() {
    setState(() {
      initState();
    });
  }

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
          title: const Text('Check Out Report'),
          backgroundColor: Colors.deepOrange[200],
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          alignment: const FractionalOffset(0.5, 0.3),
          children: [
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
                        builder: (context) => const LastCheckOut()),
                  ).then(onGoBack);
                },
                child: const Text('CLOSE'),
              ),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: BlocProvider(
              create: (_) => userBloc,
              child:
                  BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                if (state is UserInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is IndexUserLoad) {
                  return _UI(
                      context, state.userModel, onGoBack, refresh, userBloc);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
        ),
      ),
    );
  }
}

//display list data
Widget _UI(BuildContext context, state, onGoBack, refresh, userBloc) {
  return ListView.builder(
      itemCount: state == null ? 0 : state.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 1000),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(top: 20, bottom: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepOrange, width: 5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("CHECK OUT REPORT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                  // margin:
                                  //     EdgeInsets.fromLTRB(20, 10, 20, 5),
                                  child: Text("THANK YOU!",
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(children: [
                                      const Text("Name: ",
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 18)),
                                      Text(
                                        state[index].name.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 13),
                                child: Row(children: [
                                  const Text("Age: ",
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 18)),
                                  Text(
                                    state[index].age.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 13),
                                child: Row(children: [
                                  const Text("Location: ",
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 18)),
                                  Text(
                                    state[index].location.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ]),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: [
                                    const Text("Location Area: ",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 18)),
                                    Text(
                                      state[index].area.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: [
                                    const Text("Body Temperature: ",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 18)),
                                    Text(
                                      state[index].bodyTemp.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: [
                                    const Text("Date: ",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 18)),
                                    Text(
                                      state[index].date.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: const [
                                    Text("Time: ",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 18)),
                                    Text("12: 03 PM",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: [
                                    const Text("Mobile Number: ",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 18)),
                                    Text(
                                      state[index].mobileNum.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Column(children: [
                                    const Text("Vaccination Status: ",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 18)),
                                    Text(
                                      state[index].vaccStatus.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Column(children: [
                                    const Text("Risk Status: ",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 18)),
                                    Text(
                                      state[index].riskStatus.toString(),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ])),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ));
      });
}
