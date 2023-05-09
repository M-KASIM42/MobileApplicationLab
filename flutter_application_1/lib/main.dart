import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class Animal {
  late String name;
  late int age;
  late String type;
  late String race;

  Animal(this.name, this.age, this.type, this.race);

  @override
  String toString() {
    // TODO: implement toString
    return "${name}  ${age}  ${race}   ${type}";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _raceController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  List<Animal> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vet App'),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ListTile(
                  title: Text(list[index].name +
                      "  " +
                      list[index].type +
                      " " +
                      list[index].race),
                  subtitle: Text(list[index].age.toString()),
                ),
              ),
            ),
          ),
          Form(
            autovalidateMode: AutovalidateMode.always,

            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                        alignment: Alignment.center,
                        child: TextFormField(
                          
                          autovalidateMode: AutovalidateMode.disabled,
                          showCursor: false,
                          
                          validator: (value) {
                            if (value!.length < 6) {
                              return "min 6 karakter";
                            } else {
                              return null;
                            }
                          },
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Age",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: _typeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Type",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: _raceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Race",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )
                  ]),
                ]),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: "Search",
                    border: OutlineInputBorder(),
                  ))),
          Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(45)),
                label: const Text(
                  "Add Animal",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () => setState(() {
                  list.add(Animal(
                      _nameController.text,
                      int.parse(_ageController.text),
                      _typeController.text,
                      _raceController.text));
                  _nameController.clear();
                  _raceController.clear();
                  _typeController.clear();
                  _ageController.clear();
                }),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.zoom_in),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(45)),
                label: const Text(
                  "Search Animal",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () => setState(() {
                  final liste = list
                      .where(
                          (element) => element.name == _searchController.text)
                      .toList();
                  print(liste);
                }),
              )),
        ]));
  }
}
