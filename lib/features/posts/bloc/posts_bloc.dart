import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_example/features/posts/models/posts_data_model.dart';
import 'package:bloc_example/features/posts/repos/posts_repo.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostsCreateEvent>(postsCreateEvent);
  }

  FutureOr<void> postsInitialFetchEvent(PostsInitialFetchEvent event, Emitter<PostsState> emit) async {

    emit(PostsFetchingLoadingState());
    List<PostsDataModel> posts = await PostsRepo.fetchPosts();
    emit(PostFetchingSuccessState(posts: posts));
  
  }

  FutureOr<void> postsCreateEvent(PostsCreateEvent event, Emitter<PostsState> emit) async {
    bool result = await PostsRepo.createPost();
    print(result);
    if(result) {
      emit(PostCreationSuccessState());
    }
    else {
      emit(PostCreationErrorState());
    }
  }
}
