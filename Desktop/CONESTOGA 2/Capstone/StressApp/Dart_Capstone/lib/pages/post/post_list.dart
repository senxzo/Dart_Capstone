import 'package:flutter/material.dart';
import 'package:stressed_out/models/post.dart';
import 'package:stressed_out/pages/post/PostService.dart';
import 'package:stressed_out/pages/post/post_page.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late Future<List<Post>> futurePosts;

  /*@override
  void initState() {
    super.initState();
    futurePosts = fetchPosts(); // Fetch posts on widget initialization
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonComponents.tabbedAppBar(context, AppConstants.posts),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading spinner when data is loading
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show error message when there's an error
            return Text('Error: ${snapshot.error}');
          } else {
            // Show posts when data has loaded
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 48.0),
                child: Column(
                  children: snapshot.data!
                      .map((post) => PostPage(post: post))
                      .toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
