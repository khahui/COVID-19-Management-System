import 'package:flutter/material.dart';
import '../Admin Vaccination Status View/updateAppointmentDetails.dart';
import '../MOH Staff Vaccination Status View/addVaccinationDetails.dart';
import '../User Vaccination Status View/addVaccineDependent.dart';
import '../User Vaccination Status View/registerVaccination.dart';
import '../User Vaccination Status View/viewVaccineDependent.dart';

class ActorVaccination extends StatelessWidget {
  const ActorVaccination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select Actor'),
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
                      builder: (context) => const ActorVaccinationPage()),
                );
              },
              child: const Text('User'),
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
                      builder: (context) =>
                          const updateAppointmentDetailsPage()),
                );
              },
              child: const Text('Admin'),
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
                      builder: (context) => const addVaccinationDetailsPage()),
                );
              },
              child: const Text('MOH Staff'),
            ),
          ),
        ],
      ),
    );
  }
}

//create actor view
class ActorVaccinationPage extends StatelessWidget {
  const ActorVaccinationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vaccination'),
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
                      builder: (context) => const registerVaccinationPage()),
                );
              },
              child: const Text(
                'Register Vaccination',
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
                        builder: (context) => const addVaccineDependentPage()),
                  );
                },
                child: const Text('Add Vaccine Dependent',
                    style: TextStyle(fontSize: 16)),
              )),
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
                      builder: (context) => const viewVaccineDependentPage()),
                );
              },
              child: const Text(
                'View Vaccine Dependent',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
