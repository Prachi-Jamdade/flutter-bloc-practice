import 'package:bloc_example/features/characters/models/characters_data_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharactersRepo {
  static Future<List<CharactersDataModel>> fetchCharacters() async {

    List<CharactersDataModel> fetchedCharacters = [];

    try {
      HttpLink link = HttpLink("https://rickandmortyapi.com/graphql");

      GraphQLClient qlClient = GraphQLClient(
        link: link,
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      );
      QueryResult queryResult = await qlClient.query(
        QueryOptions(
          document: gql(
            """
              query {
                characters() {
                  results {
                    id
                    name
                    image 
                    status
                    gender
                  }
                }
              }
            """,
          ),
        ),
      );

      List<dynamic> data = queryResult.data!['characters']['results'];
      fetchedCharacters = data
          .map((character) => CharactersDataModel.fromJson(character))
          .toList();

      return fetchedCharacters;

    }
    catch(e) {
      print(e.toString());
      return fetchedCharacters;
    }
  
  }
  
}