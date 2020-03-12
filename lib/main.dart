import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/ui/pages/characterDetails.dart';
import 'package:rick_and_morty_app/ui/pages/myHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: <String, WidgetBuilder>{
        MyHomePage.routeName: (BuildContext context) => MyHomePage(),
        CharacterDetails.routeName: (BuildContext context) => CharacterDetails()
      },
      home: MyHomePage(title: 'My Home Page'),
    );
  }
}