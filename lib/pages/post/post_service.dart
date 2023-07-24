import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stressed_out/models/post.dart';
import 'package:stressed_out/utils/app_constants.dart';

// This contains all the user network actions.
class PostService {
  // This fetches all posts by calling the post list endpoint.
  Future<List<Post>> getPosts(String userId) async {
    const url = AppUrls.domain + AppUrls.postList;
    List<Post> posts = <Post>[];

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({'id': userId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // TODO: Convert the response to posts object.
        return posts;
      } else {
        //return 'There was a problem fetching posts. Please try again later';
        return posts;
      }
    } catch (error) {
      print('Post list error: $error');
      //return 'Unable to fetch posts';
      return posts;
    }
  }

  // This fetches a single post by calling the post details endpoint.
  Future<Post> getPost(String postId) async {
    const url = AppUrls.domain + AppUrls.postDetails;
    Post post = Post.empty();

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({'id': postId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // TODO: Convert the response to post object.
        return post;
      } else {
        //return 'There was a problem fetching a post. Please try again later';
        return post;
      }
    } catch (error) {
      print('Single post fetch error: $error');
      //return 'Unable to fetch the post';
      return post;
    }
  }

  // This is used to create a post by calling post create endpoint.
  Future<String> create(Post post) async {
    const url = AppUrls.domain + AppUrls.postCreate;

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(post.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return 'Post created successfully!';
      } else {
        return 'There was a problem creating a post. Please try again later';
      }
    } catch (error) {
      print('Post creation error: $error');
      return 'Unable to create a post';
    }
  }
}
