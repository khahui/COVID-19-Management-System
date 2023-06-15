import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Services Layer/User Movement Controller/userMovement_bloc.dart';
import '../../main.dart';
import 'movementHistory.dart';

class LastCheckOut extends StatefulWidget {
  const LastCheckOut({Key? key}) : super(key: key);

  @override
  State<LastCheckOut> createState() => _LastCheckOutState();
}

class _LastCheckOutState extends State<LastCheckOut> {
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
          title: const Text('Check Out'),
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
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  ).then(onGoBack);
                },
                child: const Text('Back to Home Page'),
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
              margin: const EdgeInsets.only(bottom: 2000),
              child: Column(children: [
                Container(
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
                              child: Text("Last Check-Out",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0)))),
                      Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 5.0),
                                  child: Text(
                                    state[index].location.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )))),
                      Row(children: [
                        Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 5.0),
                                    child: Text(
                                      state[index].date.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )))),
                        Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            child: const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Text(
                                      "12: 03 PM",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )))),
                      ]),
                    ])),
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
                            builder: (context) => const MovementHistoryPage()),
                      ).then(onGoBack);
                    },
                    child: const Text('View History'),
                  ),
                ),
              ]),
            ));
      });
}
