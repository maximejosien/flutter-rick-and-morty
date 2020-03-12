import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty_app/data/models/character.dart';

class CharacterDetails extends StatelessWidget {
  static const String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    Character character;
    if(arguments != null) character = arguments['character'];

    return Scaffold(
        appBar: AppBar(
          title: Text(character.name),
          centerTitle: true,
        ),
        body: Center(
            child : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children : <Widget> [
                  Image.network(character.image),
                  Text(character.name),
                  Text(character.status),
                  Text(character.species),
                  Text(character.type),
                  Text(character.gender),
                  Text(character.origin.name),
                  Text(character.location.name),
                  Text(new DateFormat("dd-MM-yyyy").format(DateTime.parse(character.created))),
                ]
            )
        )
    );
  }
}