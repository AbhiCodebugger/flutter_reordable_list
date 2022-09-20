import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Reordable ListView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> listOfNames = ["Alice", "Jose", "Brian", "Adam", "Lee", "Neo"];
  @override
  Widget build(BuildContext context) {
    print('build run');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: ReorderableListView(
          header: const Center(
            heightFactor: 2,
            child: Text(
              'List of Reorderable items',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          padding: const EdgeInsets.all(10),
          onReorder: reorderData,
          children: listOfNames
              .map<Widget>((e) => Card(
                    key: Key(e),
                    color: Colors.blueGrey.shade200,
                    elevation: 2.0,
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: Text(e),
                    ),
                  ))
              .toList(),
        ));
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = listOfNames.removeAt(oldindex);
      listOfNames.insert(newindex, items);
    });
  }
}
