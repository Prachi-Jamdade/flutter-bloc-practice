import 'package:bloc_example/features/posts/models/posts_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostsRepo {
  static Future<List<PostsDataModel>> fetchPosts() async {

    var client = http.Client();
    List<PostsDataModel> posts = [];

    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await client.get(url);

      List data = jsonDecode(response.body);

      for(int i=0; i<data.length; i++) {
        PostsDataModel post = PostsDataModel.fromJson(data[i]);
        posts.add(post);
      }

      print(posts);
      return posts;
    }
    catch(e) {
      print(e.toString());
      return posts;
    }

  }

  static Future<bool> createPost() async {

    var client = http.Client();

    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

      var response = await client.post(url, body: {
        "title": "Prachi's Post",
        "body": "Post body contains nothing",
        "userId": '34',
      });

      if(response.statusCode >= 200 && response.statusCode < 300) 
        return true;
      
      return false;
    }
    catch(e) {
      print(e.toString());
      return false;
    }

  }
  
}