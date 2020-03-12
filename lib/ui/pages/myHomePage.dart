import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:rick_and_morty_app/data/models/characterList.dart';
import 'package:rick_and_morty_app/data/repositories/rickAndMortyRepository.dart';
import 'package:rick_and_morty_app/ui/pages/characterDetails.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = "/home";

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
      body: FutureBuilder(
        future: RickAndMortyRepository().getCharacters(),
        builder: (BuildContext context, AsyncSnapshot<CharacterList> data) {
          if (data.hasData) {
            List<Character> characters = data.data.results;
            return ListView.separated(
                itemBuilder: (context, position) {
                  var item = characters[position];
                  return InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Image.network(item.image, height: 30),
                          Text("  "),
                          Text(
                            item.name
                          ),
                          Text(new DateFormat("  dd-MM-yyyy").format(DateTime.parse(item.created)))
                        ],
                      )
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, CharacterDetails.routeName,
                          arguments: {"character": item});
                    },
                  );
                },
                separatorBuilder: (context, position) {
                  return Divider(
                    indent: 20,
                    height: 40,
                  );
                },
                itemCount: characters.length);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
