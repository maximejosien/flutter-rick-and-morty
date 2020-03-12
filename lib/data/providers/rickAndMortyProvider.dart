import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:rick_and_morty_app/data/models/characterList.dart';

class RickAndMortyProvider {

  Future<Character> getCharacter(int id) async {
    var dio = Dio();
    Response response = await dio.get("https://rickandmortyapi.com/api/character/" + id.toString());
    return Character.fromJson(response.data);
  }

  Future<CharacterList> getCharacters() async {
    var dio = Dio();
    Response response = await dio.get("https://rickandmortyapi.com/api/character");
    return CharacterList.fromJson(response.data);
  }
}