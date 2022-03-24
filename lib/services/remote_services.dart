import 'package:flutter_api_integration/models/comment.dart';

import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }

  // getting comment function
  Future<List<Comment>?> getComments() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return commentFromJson(json);
    }
    return null;
  }
}
