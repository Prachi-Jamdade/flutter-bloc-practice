import 'package:bloc_example/features/characters/bloc/characters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharactersBloc charactersBloc = CharactersBloc();

  @override
  void initState() {
    super.initState();
    charactersBloc.add(CharactersInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters"),
      ),
      body: BlocConsumer<CharactersBloc, CharactersState>(
        bloc: charactersBloc,
        listener: (context, state) {
          
        },
        builder: (context, state) {
          switch(state.runtimeType) {
            case CharactersFetchingLoadingState:
              return (
                const Center(
                  child: const CircularProgressIndicator(),
                )
              );
            case CharactersFetchingSuccessState:
              final successState = state as CharactersFetchingSuccessState;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: successState.characters.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image(
                            image: NetworkImage(
                              successState.characters[index].image,
                            ),
                          ),
                          title: Text(
                            successState.characters[index].name,
                          ),
                        ),
                      );
                    }),
              );
            
            case CharactersFetchingErrorState:
              

            default:
              return const SizedBox();
          }
          
        },
      ),
    );
  }
}
