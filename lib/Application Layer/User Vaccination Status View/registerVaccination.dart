import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data Layer/Model/UserVaccinationModel.dart';
import '../../Services Layer/User Vaccination Controller/UserVaccination_bloc.dart';
import 'viewAppointmentDetails.dart';

class registerVaccinationPage extends StatelessWidget {
  const registerVaccinationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _icpn = TextEditingController(); //IC/PassportNo
    TextEditingController _age = TextEditingController();
    TextEditingController _gender = TextEditingController();
    TextEditingController _address = TextEditingController();
    TextEditingController _postcode = TextEditingController();
    TextEditingController _state = TextEditingController();
    final UserBloc userBloc = UserBloc();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Vaccination Registration'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocProvider(
          create: (_) => userBloc,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Card(
                  elevation: 10,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: Form(
                      key: _formKey,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //insert full name
                            TextFormField(
                              controller: _name,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Full Name',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //insert IC/Passport No
                            TextFormField(
                              controller: _icpn,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'IC/Passport No',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your IC/Passport No';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //insert age
                            TextFormField(
                              controller: _age,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Age',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your age';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //insert gender
                            TextFormField(
                              controller: _gender,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Gender',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your gender';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //insert address
                            TextFormField(
                              controller: _address,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Address',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //insert postcode
                            TextFormField(
                              controller: _postcode,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Postcode',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your postcode';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //insert state
                            TextFormField(
                              controller: _state,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'State',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your state';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(70, 30, 70, 10),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.deepOrangeAccent)),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    //add to model
                                    UserVaccinationModel uservaccinationModel =
                                        UserVaccinationModel(
                                            name: _name.text,
                                            icpn: _icpn.text,
                                            age: int.parse(_age.text),
                                            gender: _gender.text,
                                            address: _address.text,
                                            postcode: int.parse(_postcode.text),
                                            state: _state.text);

                                    //add to bloc
                                    userBloc.add(
                                        InsertUserData(uservaccinationModel));

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Registration Successful'),
                                          backgroundColor:
                                              Colors.deepOrangeAccent),
                                    );
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('SAVE'),
                              ),
                            ),
                          ],
                        ),
                      ))),
            ],
          ),
        ),
      ),
    ));
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
                                                      const viewAppointmentDetailsPage(),
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
                              state[index].icpn.toString(),
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
