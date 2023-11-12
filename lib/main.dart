import 'package:flutter/material.dart';
import 'package:haircut/pages/main_page/create_customer_page.dart';
import 'package:haircut/pages/main_page/main_page.dart';
import 'package:haircut/pages/main_page/menu_page.dart';
import 'package:haircut/pages/main_page/search_page.dart';
import 'package:haircut/pages/my_page/additional_doc_page.dart';
import 'package:haircut/pages/my_page/license_page.dart';
import 'package:haircut/pages/my_page/my_geolocation_page.dart';
import 'package:haircut/pages/my_page/my_address.dart';
import 'package:haircut/pages/my_page/my_page.dart';
import 'package:haircut/pages/my_page/my_photo_album.dart';
import 'package:haircut/pages/my_page/my_phone_page.dart';
import 'package:haircut/pages/my_page/my_services_page.dart';

import 'info_listview_menu.dart';

void main() {
  runApp(const HairCutApp());
}

class HairCutApp extends StatelessWidget{
  const HairCutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AddCustomerPage(),
      )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
