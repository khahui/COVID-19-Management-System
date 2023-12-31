import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testaapril/Services Layer/Admin%20Controller/admin_bloc.dart';
// import 'package:testaapril/Data%20Layer/Model/MOHStaffUserQuarantineRecordModel.dart';

import '../../Data Layer/Model/MOHStaffUserQuarantineRecordModel.dart';
import '../../Services Layer/MOH Staff User Quarantine Record Controller/MOHStaffUserQuarantineRecord_bloc.dart';

class UpdateAdminPage extends StatefulWidget {
  const UpdateAdminPage({Key? key}) : super(key: key);

  @override
  State<UpdateAdminPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateAdminPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _symptoms = TextEditingController();
  TextEditingController _bodycondition = TextEditingController();
  TextEditingController _quarantineplace = TextEditingController();
  final AdminBloc adminBloc = AdminBloc();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: const Text('Update Admin Data'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
              create: (context) {
                adminBloc.add(GetAdminData(id));
                return adminBloc;
              },
              child: BlocBuilder<AdminBloc, AdminState>(
                builder: (context, state) {
                  if (state is AdminInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AdminLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateAdminLoad) {
                    _name.text = state.adminModel.name;
                    _age.text = state.adminModel.age.toString();

                    return ListView(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Card(
                          elevation: 10,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 1),
                          child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      controller: _name,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter your name',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _age,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter age',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter age';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _symptoms,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter symptoms',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _bodycondition,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter body condition',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _quarantineplace,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter quarantineplace',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          70, 30, 70, 10),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            //add to model
                                            AdminModel adminModel = AdminModel(
                                              name: _name.text,
                                              age: int.parse(_age.text),
                                              symptoms: _symptoms.text,
                                              bodycondition:
                                                  _bodycondition.text,
                                              quarantineplace:
                                                  _quarantineplace.text,
                                            );

                                            //update to bloc
                                            adminBloc.add(
                                                UpdateAdminData(adminModel));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Data Added Successfully'),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: const Text('Submit'),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )),
    );
  }
}
