part of 'characters_bloc.dart';

sealed class CharactersState extends Equatable {
  const CharactersState();
  
  @override
  List<Object> get props => [];
}

final class CharactersInitial extends CharactersState {}

final class CharactersFetchingLoadingState extends CharactersState {

}

final class CharactersFetchingErrorState extends CharactersState {

}

final class CharactersFetchingSuccessState extends CharactersState {
  final List<CharactersDataModel> characters;

  CharactersFetchingSuccessState({required this.characters});

}
