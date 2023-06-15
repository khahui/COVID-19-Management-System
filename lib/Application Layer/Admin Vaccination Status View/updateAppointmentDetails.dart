import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data Layer/Model/AdminVaccinationModel.dart';
import '../../Services Layer/Admin Vaccination Controller/AdminVaccination_bloc.dart';

class updateAppointmentDetailsPage extends StatelessWidget {
  const updateAppointmentDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _place = TextEditingController(); //vaccination place
    TextEditingController _date = TextEditingController(); //vaccination date
    TextEditingController _time = TextEditingController(); //vaccination time
    final AdminVaccinationBloc adminBloc = AdminVaccinationBloc();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text('Appointment Details'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
            create: (_) => adminBloc,
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //vaccination place
                              TextFormField(
                                controller: _place,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'VACCINATION PLACE',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter vaccination place';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //vaccination date
                              TextFormField(
                                controller: _date,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'VACCINATION DATE',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter vaccination date';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //vaccination time
                              TextFormField(
                                controller: _time,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'VACCINATION TIME',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter vaccination time';
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
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepOrangeAccent)),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      //add to model
                                      AdminVaccinationModel adminModel =
                                          AdminVaccinationModel(
                                              place: _place.text,
                                              date: _date.text,
                                              time: int.parse(_time.text));

                                      //add to bloc
                                      adminBloc
                                          .add(UpdateAdminData(adminModel));

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Data Added Successfully'),
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
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
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
