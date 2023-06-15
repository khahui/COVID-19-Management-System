// // ignore_for_file: unnecessary_new

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';

// //import 'package:flutter_bloc/flutter_bloc.dart';
// //import 'package:testaapril/Services Layer/Admin%20Controller/admin_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'casesInformation.dart';
import 'sopInformation.dart';

class userViewInformation extends StatefulWidget {
  const userViewInformation({Key? key}) : super(key: key);

  @override
  State<userViewInformation> createState() => _userViewInformationState();
}

class _userViewInformationState extends State<userViewInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Covid-19 Information'),
        backgroundColor: Colors.deepOrange[200],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrangeAccent)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InformationCases()),
                );
              },
              child: const Text(
                'Covid-19 Cases',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrangeAccent)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InformationSOPs()),
                );
              },
              child: const Text(
                'Covid-19 SOPs',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}



// class MyCheckBox extends StatefulWidget {
//   MyCheckBox({
//     Key? key,
//   }) : super(key: key);
//   //final String title;
//   @override
//   _MyCheckBoxState createState() => _MyCheckBoxState();
// }

// class _MyCheckBoxState extends State<MyCheckBox> {
//   bool _checkbox = false;
//   bool _checkboxListTile1 = false;
//   bool _checkboxListTile2 = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepOrange[50],
//       body: Center(
//         child: Column(
//           children: [
//             const Text(
//               "\n\nI want to check-in with..\n",
//               style: TextStyle(fontSize: 20),
//             ),
//             CheckboxListTile(
//               controlAffinity: ListTileControlAffinity.leading,
//               title: const Text('Ali bin Abu'),
//               value: _checkboxListTile1,
//               onChanged: (value) {
//                 setState(() {
//                   _checkboxListTile1 = !_checkboxListTile1;
//                 });
//               },
//             ),
//             CheckboxListTile(
//               controlAffinity: ListTileControlAffinity.leading,
//               title: const Text('Farah binti Abu'),
//               value: _checkboxListTile2,
//               onChanged: (value) {
//                 setState(() {
//                   _checkboxListTile2 = !_checkboxListTile2;
//                 });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// //
// class MyTextField extends StatefulWidget {
//   const MyTextField({super.key});

//   @override
//   State<MyTextField> createState() => _MyTextFieldState();
// }

// class _MyTextFieldState extends State<MyTextField> {
//   TextEditingController nameController = TextEditingController()
//     ..text = 'AHMAD BIN HAFIZ';
//   TextEditingController locationController = TextEditingController();
//   TextEditingController bodyTempController = TextEditingController();
//   TextEditingController dateinput = TextEditingController();
//   bool _isChecked = false;
//   void checkBoxCallBack(bool? checkBoxState) {
//     if (checkBoxState != null) {
//       setState(() {
//         _isChecked = checkBoxState;
//       });
//     }
//   }

//   String FullName = '';
//   String location = '';
//   String bodyTemp = '';
//   void initState() {
//     dateinput.text = ""; //set the initial value of text field
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: Colors.deepOrange[50],
//             body: Column(children: <Widget>[
//               Container(
//                   margin: const EdgeInsets.all(20),
//                   child: TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.deepOrange, width: 1.5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.deepOrange, width: 2.5)),
//                         labelText: 'Full Name',
//                         floatingLabelStyle:
//                             TextStyle(color: Colors.deepOrange)),
//                     onChanged: (text) {
//                       setState(() {
//                         FullName = text;
//                         //you can access nameController in its scope to get
//                         // the value of text entered as shown below
//                         //UserName = nameController.text;
//                       });
//                     },
//                   )),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//                 child: new Theme(
//                     data: new ThemeData(primaryColor: Colors.redAccent),
//                     child: new TextField(
//                       controller: locationController,
//                       decoration: const InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 15),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.deepOrange, width: 1.5)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.deepOrange, width: 2.5)),
//                           labelText: 'Check-In Location',
//                           floatingLabelStyle:
//                               TextStyle(color: Colors.deepOrange),
//                           hintText: "Enter Location Name Only"),
//                       onChanged: (text) {
//                         setState(() {
//                           location = text;
//                         });
//                       },
//                     )),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//                 child: new Theme(
//                     data: new ThemeData(primaryColor: Colors.redAccent),
//                     child: new TextField(
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.singleLineFormatter
//                       ],
//                       controller: bodyTempController,
//                       decoration: const InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 15),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.deepOrange, width: 1.5)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.deepOrange, width: 2.5)),
//                           labelText: 'Body Temperature',
//                           floatingLabelStyle:
//                               TextStyle(color: Colors.deepOrange),
//                           hintText: "(in Celsius)"),
//                       onChanged: (text) {
//                         setState(() {
//                           bodyTemp = text;
//                         });
//                       },
//                     )),
//               ),
//               Container(
//                   padding: const EdgeInsets.all(15),
//                   height: 150,
//                   child: Center(
//                       child: TextField(
//                     controller:
//                         dateinput, //editing controller of this TextField
//                     decoration: const InputDecoration(
//                         icon: Icon(Icons.calendar_today), //icon of text field
//                         labelText: "Enter Date" //label text of field
//                         ),
//                     readOnly:
//                         true, //set it true, so that user will not able to edit text
//                     onTap: () async {
//                       DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(
//                               2000), //DateTime.now() - not to allow to choose before today.
//                           lastDate: DateTime(2101));

//                       if (pickedDate != null) {
//                         print(
//                             pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                         String formattedDate =
//                             DateFormat('yyyy-MM-dd').format(pickedDate);
//                         print(
//                             formattedDate); //formatted date output using intl package =>  2021-03-16
//                         //you can implement different kind of Date Format here according to your requirement

//                         setState(() {
//                           dateinput.text =
//                               formattedDate; //set output date to TextField value.
//                         });
//                       } else {
//                         print("Date is not selected");
//                       }
//                     },
//                   )))
//             ])));
//   }
// }

// class MyDate extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyDate();
//   }
// }

// class _MyDate extends State<MyDate> {
//   TextEditingController dateinput = TextEditingController();
//   //text editing controller for text field

//   @override
//   void initState() {
//     dateinput.text = ""; //set the initial value of text field
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("DatePicker on TextField"),
//           backgroundColor: Colors.redAccent, //background color of app bar
//         ),
//         body: Container(
//             padding: const EdgeInsets.all(15),
//             height: 150,
//             child: Center(
//                 child: TextField(
//               controller: dateinput, //editing controller of this TextField
//               decoration: const InputDecoration(
//                   icon: Icon(Icons.calendar_today), //icon of text field
//                   labelText: "Enter Date" //label text of field
//                   ),
//               readOnly:
//                   true, //set it true, so that user will not able to edit text
//               onTap: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(
//                         2000), //DateTime.now() - not to allow to choose before today.
//                     lastDate: DateTime(2101));

//                 if (pickedDate != null) {
//                   print(
//                       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                   String formattedDate =
//                       DateFormat('yyyy-MM-dd').format(pickedDate);
//                   print(
//                       formattedDate); //formatted date output using intl package =>  2021-03-16
//                   //you can implement different kind of Date Format here according to your requirement

//                   setState(() {
//                     dateinput.text =
//                         formattedDate; //set output date to TextField value.
//                   });
//                 } else {
//                   print("Date is not selected");
//                 }
//               },
//             ))));
//   }
// }

// class CheckInAlonePage extends StatefulWidget {
//   const CheckInAlonePage({super.key});

//   @override
//   State<CheckInAlonePage> createState() => _CheckInAlonePageState();
// }

// class _CheckInAlonePageState extends State<CheckInAlonePage> {
//   onGoBack(dynamic value) {
//     setState(() {
//       initState();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: const MyTextField(),
//         backgroundColor: Colors.deepOrange[50],
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('Check-In Alone'),
//           backgroundColor: Colors.deepOrange[200],
//         ),
//         bottomNavigationBar: Stack(
//           clipBehavior: Clip.none,
//           alignment: const FractionalOffset(1.0, 0.3),
//           children: [
//             Container(
//               height: 40.0,
//               color: Colors.white,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const DependentPage()),
//                   ).then(onGoBack);
//                 },
//                 child: const Text('CHECK IN'),
//               ),
//             ),
//           ],
//         ),

//         /*child: BlocProvider(
//               create: (_) => adminBloc,
//               child:
//               BlocBuilder<AdminBloc, AdminState>(builder: (context, state) {
//                 if (state is AdminInitial) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is AdminLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is IndexAdminLoad) {
//                   return _UI(
//                       context, state.adminModel, onGoBack, refresh, adminBloc);
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               })),*/
//       ),
//     );
//   }

//   BlocProvider({required Function(dynamic _) create, required child}) {}
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Center(
//         child: Shortcuts(
//           shortcuts: const <ShortcutActivator, Intent>{
//             // Pressing space in the field will now move to the next field.
//             SingleActivator(LogicalKeyboardKey.space): NextFocusIntent(),
//           },
//           child: FocusTraversalGroup(
//             child: Form(
//               autovalidateMode: AutovalidateMode.always,
//               onChanged: () {
//                 Form.of(primaryFocus!.context!)!.save();
//               },
//               child: Wrap(
//                 children: List<Widget>.generate(1, (int index) {
//                   return Container(
//                     child: ConstrainedBox(
//                       constraints: BoxConstraints.tight(const Size(200, 50)),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                             icon: Icon(Icons.person), labelText: 'Name *'),
//                         onSaved: (String? value) {
//                           debugPrint(
//                               'Value for field $index saved as "$value"');
//                         },
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DependentPage extends StatefulWidget {
//   const DependentPage({Key? key}) : super(key: key);

//   @override
//   State<DependentPage> createState() => _DependentPageState();
// }

// class _DependentPageState extends State<DependentPage> {
//   //final AdminBloc adminBloc = AdminBloc();

//   //get data when initial this state
//   /*@override
//   void initState() {
//     adminBloc.add(GetAdminList());
//     super.initState();
//   }*/

//   //refresh when pop
//   onGoBack(dynamic value) {
//     setState(() {
//       initState();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.deepOrange[50],
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('Check-In With My Dependents'),
//           backgroundColor: Colors.deepOrange[200],
//         ),
//         bottomNavigationBar: Stack(
//             clipBehavior: Clip.none,
//             alignment: const FractionalOffset(1.0, 0.3),
//             children: [
//               Container(
//                 height: 40.0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Colors.deepOrangeAccent)),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const AddAdminPage()),
//                     ).then(onGoBack);
//                   },
//                   child: const Text('CONFIRM'),
//                 ),
//               ),
//             ]),
//         body: MyCheckBox(),
//         /*child: BlocProvider(
//               create: (_) => adminBloc,
//               child:
//               BlocBuilder<AdminBloc, AdminState>(builder: (context, state) {
//                 if (state is AdminInitial) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is AdminLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is IndexAdminLoad) {
//                   return _UI(
//                       context, state.adminModel, onGoBack, refresh, adminBloc);
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               })),*/
//       ),
//     );
//   }

//   //BlocProvider({required Function(dynamic _) create, required child}) {}
// }

// //display list data
// Widget _UI(BuildContext context, state, onGoBack, refresh, adminBloc) {
//   return ListView.builder(
//       itemCount: state == null ? 0 : state.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {},
//           child: Card(
//             elevation: 5,
//             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.only(bottom: 8),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 8, right: 8),
//                                 child: Text(
//                                   state[index].name.toString(),
//                                   style: const TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               /*Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       IconButton(
//                                         icon: const Icon(Icons.edit),
//                                         onPressed: () {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   //builder: (context) => const UpdateAdminPage(),
//                                                   //settings: RouteSettings(
//                                                     //arguments: {
//                                                       //"id": state[index].id.toString(),
//                                                     //},
//                                                   ))).then(onGoBack);
//                                         },
//                                       ),
//                                       /*IconButton(
//                                         icon: const Icon(Icons.delete),
//                                         onPressed: () {
//                                           adminBloc.add(DeleteAdminData(state[index].id));
//                                           refresh();
//                                         },
//                                       ),*/
//                                     ],
//                                   )
//                                 ],
//                               )*/
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8, right: 8),
//                             child: Text(
//                               state[index].age.toString(),
//                               style: const TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black38),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       });
// }

// /*onGoBack(dynamic value) {
//     setState(() {
//       initState();
//     });*/
// class AddAdminPage extends StatelessWidget {
//   const AddAdminPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();
//     TextEditingController _name = TextEditingController();
//     TextEditingController _age = TextEditingController();
//     //final AdminBloc adminBloc = AdminBloc();

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueAccent,
//           title: const Text('add Admin Data'),
//         ),
//         body: GestureDetector(
//           onTap: () {
//             FocusManager.instance.primaryFocus?.unfocus();
//           },
//           child: BlocProvider(
//             //create: (_) => adminBloc,
//             child: ListView(
//               children: [
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Card(
//                     elevation: 10,
//                     margin:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
//                     child: Form(
//                         key: _formKey,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 10, right: 10, top: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               TextFormField(
//                                 controller: _name,
//                                 decoration: const InputDecoration(
//                                   border: UnderlineInputBorder(),
//                                   labelText: 'Enter your name',
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter some text';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(70, 30, 70, 10),
//                                 child: ElevatedButton(
//                                   onPressed: () async {
//                                     if (_formKey.currentState!.validate()) {
//                                       //add to model
//                                       AdminModel userModel = AdminModel(
//                                           name: _name.text,
//                                           age: int.parse(_age.text));

//                                       //add to bloc
//                                       //adminBloc.add(InsertAdminData(userModel));

//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content:
//                                               Text('Data Added Successfully'),
//                                           backgroundColor: Colors.green,
//                                         ),
//                                       );
//                                       Navigator.pop(context);
//                                     }
//                                   },
//                                   child: const Text('Submit'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ))),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   BlocProvider({required ListView child}) {}
// }

// class AdminModel {
//   final int? id;
//   final String name;
//   final int age;

//   AdminModel({
//     this.id,
//     required this.name,
//     required this.age,
//   });

//   factory AdminModel.fromJson(Map<String, dynamic> json) {
//     return AdminModel(
//       id: json["id"],
//       name: json["name"],
//       age: json["age"],
//     );
//   }

//   Map<String, dynamic> toJson() => {"id": id, "name": name, "age": age};
// }
