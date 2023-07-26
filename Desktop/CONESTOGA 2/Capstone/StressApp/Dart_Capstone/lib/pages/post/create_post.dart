import 'package:flutter/material.dart';
import 'package:stressed_out/models/network_result.dart';
import 'package:stressed_out/models/post.dart';
import 'package:stressed_out/pages/components/common_components.dart';
import 'package:stressed_out/pages/post/PostService.dart';
import 'package:stressed_out/utils/app_constants.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Post post = Post.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponents.commonAppBar(context, AppConstants.createPost),
      body: Material(
        elevation: 0.5,
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Content"),
                  maxLines: null,
                  minLines: 10,
                  onSaved: (value) {
                    post.content = value ?? '';
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      NetworkResult nr = await addNewPost(post.content ?? '');

                      // Showing a toaster message bottom of the screen.
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(nr.message)));

                      // If it was created successfully, then pop the screen.
                      if (nr.status) {
                        Navigator.pop(context);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please enter the details")));
                    }
                  },
                  child: const Text(AppConstants.createPost),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
