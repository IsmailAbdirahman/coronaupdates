import 'package:flutter/material.dart';
import 'Home/Home.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(100, 109, 114, 224),
        primarySwatch: Colors.blue,
      ),
      home:Home()
    );
  }
}

