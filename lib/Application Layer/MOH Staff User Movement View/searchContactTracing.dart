import 'package:flutter/material.dart';

class ContactTracing extends StatefulWidget {
  const ContactTracing({Key? key}) : super(key: key);

  @override
  _ContactTracingState createState() => _ContactTracingState();
}

class _ContactTracingState extends State<ContactTracing> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "location": "KFC", "name": "Ali bin Abu", "date": "12/06/2022"},
    {
      "id": 2,
      "location": "Aman Central",
      "name": "Ahmad bin Mohammad",
      "date": "29/05/2022"
    },
    {
      "id": 3,
      "location": "Kuantan City Mall",
      "name": "Zuraini binti Rosmah",
      "date": "28/05/2022"
    },
    {
      "id": 4,
      "location": "Kuantan City Mall",
      "name": "Lee Ching Yen",
      "date": "20/05/2022"
    },
    {
      "id": 5,
      "location": "KFC",
      "name": "Fatimah binti Zairul",
      "date": "23/04/2022"
    },
    {"id": 6, "location": "MCD", "name": "Carrissa Wong", "date": "25/03/2022"},
    {
      "id": 7,
      "location": "Billion Supermarket",
      "name": "Chow Wei Xiang",
      "date": "20/02/2022"
    },
    {
      "id": 8,
      "location": "Aman Central",
      "name": "Rohani binti Mohammad",
      "date": "19/02/2022"
    },
    {
      "id": 9,
      "location": "Bubble Cafe",
      "name": "Farah binti Isa",
      "date": "11/02/2022"
    },
    {
      "id": 10,
      "location": "Berry Bakery",
      "name": "Ibami bin Hafiz",
      "date": "10/01/2022"
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) => user["location"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange[200],
        title: const Text('Contact Tracing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                  ),
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  labelText: 'Search Location History',
                  suffixIcon: Icon((Icons.search)),
                  iconColor: Colors.deepOrange),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.orange,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(_foundUsers[index]['location']),
                          subtitle:
                              Text('${_foundUsers[index]["name"].toString()} '),
                          trailing: Text(_foundUsers[index]['date']),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
