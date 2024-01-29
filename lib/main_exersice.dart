import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputToSave = TextEditingController();
  String storedInput = 'storedInput';

  @override
  void initState() {
    super.initState();
    giveInput();
  }

  Future<void> saveInput() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('storedInput', inputToSave.text);
    storedInput = inputToSave.text;
    inputToSave.clear();
  }

  Future<void> giveInput() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String storedValue = pref.getString('storedInput') ?? "";
    print("Stored Input: $storedValue");
    setState(() {
      storedInput = storedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Shared Preferences'),
          ),
          body: Column(children: [
            TextField(
              controller: inputToSave,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await saveInput();
              },
              child: const Text('Speichern'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  giveInput();
                },
                child: const Text('Wiedergabe')),
          ])),
    );
  }
}
