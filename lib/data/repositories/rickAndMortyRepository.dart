import 'package:rick_and_morty_app/data/models/character.dart';
import 'package:rick_and_morty_app/data/models/characterList.dart';
import 'package:rick_and_morty_app/data/providers/rickAndMortyProvider.dart';

class RickAndMortyRepository {
  Future<Character> getCharacter(int id) => RickAndMortyProvider().getCharacter(id);

  Future<CharacterList> getCharacters() => RickAndMortyProvider().getCharacters();
}