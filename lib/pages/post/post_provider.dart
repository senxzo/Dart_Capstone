import 'package:flutter/foundation.dart';
import 'package:stressed_out/models/post.dart';
import 'package:stressed_out/pages/post/post_service.dart';

class PostProvider extends ChangeNotifier {
  final PostService _postService = PostService();

  // This calls the get posts service call and update the data listeners.
  Future<void> getPosts(String userId) async {
    // TODO: Based on success or failure have to do basic things.
    await _postService.getPosts(userId);
    notifyListeners();
  }

  // This calls the get post service call and update the data listeners.
  Future<void> getPost(String postId) async {
    // TODO: Based on response set the post details.
    await _postService.getPost(postId);
    notifyListeners();
  }

  // This calls the post details service call and update the data listeners.
  Future<void> createPost(Post post) async {
    // TODO: Based on success or failure have to do basic things.
    await _postService.create(post);
    notifyListeners();
  }
}
