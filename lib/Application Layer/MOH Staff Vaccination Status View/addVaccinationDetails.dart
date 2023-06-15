import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data Layer/Model/MOHStaffVaccinationModel.dart';
import '../../Services Layer/MOH Staff Vaccination Controller/MOHStaffVaccination_bloc.dart';

class addVaccinationDetailsPage extends StatelessWidget {
  const addVaccinationDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _date =
        TextEditingController(); //date of user get vaccine
    TextEditingController _time =
        TextEditingController(); //time of user get vaccine
    TextEditingController _manufacturer =
        TextEditingController(); //manufacturer of vaccine
    TextEditingController _vaccineNum =
        TextEditingController(); //vaccine number
    TextEditingController _batchNum =
        TextEditingController(); //batch number of vaccine
    TextEditingController _expiryDate =
        TextEditingController(); //expiry date of vaccine
    TextEditingController _vaccStatus =
        TextEditingController(); //vaccination status
    final MOHStaffVaccinationBloc mohstaffvaccinationBloc =
        MOHStaffVaccinationBloc();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text('Vaccination Details'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
            create: (_) => mohstaffvaccinationBloc,
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
                              TextFormField(
                                controller: _manufacturer,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'MANUFACTURER',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter manufacturer';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _vaccineNum,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'VACCINE NUMBER',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter vaccine number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _batchNum,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'BATCH NUMBER',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter batch number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _expiryDate,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'EXPIRY DATE',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter expiry date';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _vaccStatus,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'VACCINATION STATUS',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter vaccination status';
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
                                      MOHStaffVaccinationModel
                                          uservaccinationModel =
                                          MOHStaffVaccinationModel(
                                              date: _date.text,
                                              time: int.parse(_time.text),
                                              manufacturer: _manufacturer.text,
                                              vaccineNum:
                                                  int.parse(_vaccineNum.text),
                                              batchNum: _batchNum.text,
                                              expiryDate: _expiryDate.text,
                                              vaccStatus: _vaccStatus.text);

                                      //add to bloc
                                      mohstaffvaccinationBloc.add(
                                          InsertMOHStaffData(
                                              uservaccinationModel));

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
