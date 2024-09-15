part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

final class CharactersInitialFetchEvent extends CharactersEvent {

}
