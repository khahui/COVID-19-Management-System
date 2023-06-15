import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data Layer/Model/UserMovementModel.dart';
import '../../Services Layer/User Movement Controller/userMovement_bloc.dart';
import 'checkInReportWithDependent.dart';
import 'checkInReport.dart';

class AddDetailPage extends StatelessWidget {
  const AddDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _location = TextEditingController();
    TextEditingController _area = TextEditingController();
    TextEditingController _bodyTemp = TextEditingController();
    TextEditingController _date = TextEditingController();
    TextEditingController _time = TextEditingController();
    TextEditingController _mobileNum = TextEditingController();
    TextEditingController _vaccStatus = TextEditingController();
    TextEditingController _riskStatus = TextEditingController();
    final UserBloc userBloc = UserBloc();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrange[200],
          title: const Text('Insert Check-In Details'),
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: _name,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your name',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                controller: _age,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter age',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a age';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _location,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your check-in location',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  hintText: "Enter Location Name Only",
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
                                controller: _area,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your location area',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  hintText: "City, State.",
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                controller: _bodyTemp,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your body temperature',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  hintText: "(in Celsius)",
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
                                controller: _date,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter date',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a date';
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
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange,
                                            width: 1.5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange,
                                            width: 2.5)),
                                    labelText: 'Enter time',
                                    floatingLabelStyle:
                                        TextStyle(color: Colors.deepOrange)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter time';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _mobileNum,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your mobile number',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a mobile number';
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
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText:
                                      'Enter your current vaccination status',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
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
                                controller: _riskStatus,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange,
                                            width: 1.5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange,
                                            width: 2.5)),
                                    labelText: 'Enter your current risk status',
                                    floatingLabelStyle:
                                        TextStyle(color: Colors.deepOrange)),
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
                                      UserModel userModel = UserModel(
                                        name: _name.text,
                                        age: int.parse(_age.text),
                                        location: _location.text,
                                        area: _area.text,
                                        bodyTemp: int.parse(_bodyTemp.text),
                                        date: _date.text,
                                        time: _time.text,
                                        mobileNum: _mobileNum.text,
                                        vaccStatus: _vaccStatus.text,
                                        riskStatus: _riskStatus.text,
                                      );

                                      //add to bloc
                                      userBloc.add(InsertUserData(userModel));
                                      // Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CheckInReport()),
                                      );
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

//Case for dependents exist
class AddDetailDependentPage extends StatelessWidget {
  const AddDetailDependentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _location = TextEditingController();
    TextEditingController _area = TextEditingController();
    TextEditingController _bodyTemp = TextEditingController();
    TextEditingController _date = TextEditingController();
    TextEditingController _time = TextEditingController();
    TextEditingController _mobileNum = TextEditingController();
    TextEditingController _vaccStatus = TextEditingController();
    TextEditingController _riskStatus = TextEditingController();
    TextEditingController _dependentBodyTemp = TextEditingController();
    final UserBloc userBloc = UserBloc();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrange[200],
          title: const Text('Insert Check-In Details'),
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: _name,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your name',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                controller: _age,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter age',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a age';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _location,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your check-in location',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  hintText: "Enter Location Name Only",
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
                                controller: _area,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your location area',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  hintText: "City, State.",
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                controller: _bodyTemp,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your body temperature',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                  hintText: "(in Celsius)",
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
                                controller: _date,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter date',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a date';
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
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange,
                                            width: 1.5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange,
                                            width: 2.5)),
                                    labelText: 'Enter time',
                                    floatingLabelStyle:
                                        TextStyle(color: Colors.deepOrange)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter time';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                controller: _mobileNum,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText: 'Enter your mobile number',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a mobile number';
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
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 1.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                          width: 2.5)),
                                  labelText:
                                      'Enter your current vaccination status',
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.deepOrange),
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
                                controller: _riskStatus,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange,
                                            width: 1.5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange,
                                            width: 2.5)),
                                    labelText: 'Enter your current risk status',
                                    floatingLabelStyle:
                                        TextStyle(color: Colors.deepOrange)),
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
                                      UserModel userModel = UserModel(
                                        name: _name.text,
                                        age: int.parse(_age.text),
                                        location: _location.text,
                                        area: _area.text,
                                        bodyTemp: int.parse(_bodyTemp.text),
                                        date: _date.text,
                                        time: _time.text,
                                        mobileNum: _mobileNum.text,
                                        vaccStatus: _vaccStatus.text,
                                        riskStatus: _riskStatus.text,
                                      );

                                      //add to bloc
                                      userBloc.add(InsertUserData(userModel));
                                      // Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DependentCheckInReport()),
                                      );
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
