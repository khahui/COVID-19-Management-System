import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Services Layer/User Vaccination Controller/UserVaccination_bloc.dart';
import 'registerVaccination.dart';
import 'viewVaccinationDetails.dart';

class viewAppointmentDetailsPage extends StatefulWidget {
  const viewAppointmentDetailsPage({Key? key}) : super(key: key);

  @override
  State<viewAppointmentDetailsPage> createState() =>
      _viewAppointmentDetailsPageState();
}

class _viewAppointmentDetailsPageState
    extends State<viewAppointmentDetailsPage> {
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
        appBar: AppBar(
          title: const Text('VACCINATION'),
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          alignment: const FractionalOffset(1.0, 0.3),
          children: [
            Container(
              height: 40.0,
              color: Colors.white,
            ),
            //Padding(
            //padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
            //child: ElevatedButton(
            // onPressed: () {
            //   Navigator.push(
            //context,
            //MaterialPageRoute(
            //builder: (context) => const registerVaccinationPage()),
            //).then(onGoBack);
            //},
            //child: const Text('register vaccination'),
            //),
            //),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: BlocProvider(
              create: (_) => userBloc,
              child: BlocBuilder<UserBloc, UserVaccinationState>(
                  builder: (context, state) {
                if (state is UserInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is IndexUserLoad) {
                  return _UI(context, state.uservaccinationModel, onGoBack,
                      refresh, userBloc);
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
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  state[index].name.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const viewVaccinationDetailsPage(),
                                                  settings: RouteSettings(
                                                    arguments: {
                                                      "id": state[index]
                                                          .id
                                                          .toString(),
                                                    },
                                                  ))).then(onGoBack);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          userBloc.add(
                                              DeleteUserData(state[index].id));
                                          refresh();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              state[index].age.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
