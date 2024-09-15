import 'package:bloc_example/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    super.initState();
    postsBloc.add(PostsInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          postsBloc.add(PostsCreateEvent());
        }, 
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen: (previous, current) => current is PostsActionsState,
        buildWhen: (previous, currnet) => currnet is !PostsActionsState,
        listener: (context, state) {
          
        },
        builder: (context, state) {
          switch(state.runtimeType) {
            case PostsFetchingLoadingState:
              return const Center(
                child: const CircularProgressIndicator(),
              );
            case PostsFetchingErrorState:
            case PostFetchingSuccessState:
              final successState = state as PostFetchingSuccessState;
              return Container(
                child: ListView.builder(itemCount: successState.posts.length, itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(successState.posts[index].title),
                        Text(successState.posts[index].body),
                      ],
                    ),
                  );
                },),
              );
            
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
