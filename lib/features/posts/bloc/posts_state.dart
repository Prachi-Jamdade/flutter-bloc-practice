part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();
  
  @override
  List<Object> get props => [];
}

abstract class PostsActionsState extends PostsState {

}

final class PostsInitial extends PostsState {}

final class PostsFetchingLoadingState extends PostsState {

}

final class PostsFetchingErrorState extends PostsState {
  
}

final class PostFetchingSuccessState extends PostsState {
  final List<PostsDataModel> posts;

  PostFetchingSuccessState({required this.posts});

}

final class PostCreationSuccessState extends PostsActionsState {

}

final class PostCreationErrorState extends PostsActionsState {

}
