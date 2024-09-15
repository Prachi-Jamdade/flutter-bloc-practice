import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/features/characters/models/characters_data_model.dart';
import 'package:bloc_example/features/characters/repos/characters_repo.dart';
import 'package:equatable/equatable.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<CharactersInitialFetchEvent>(charactersInitialFetchEvent);
  }

  FutureOr<void> charactersInitialFetchEvent(event, Emitter<CharactersState> emit) async {
    emit(CharactersFetchingLoadingState());
    List<CharactersDataModel> characters = await CharactersRepo.fetchCharacters();
    emit(CharactersFetchingSuccessState(characters: characters));
  }
}
