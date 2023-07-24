import 'package:flutter/material.dart';
import 'package:stressed_out/models/post.dart';
import 'package:stressed_out/utils/app_colors.dart';

class PostPage extends StatelessWidget {
  final Post post;

  PostPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.profilePictureUrl),
            ),
            title: Text(
              post.userName,
              style: TextStyle(
                color: AppColors.primarySwatch.shade900,
              ),
            ),
            subtitle: Text(post.date),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(post.content),
          ),
          /* Divider(),*/
          ExpansionTile(
            backgroundColor: AppColors.primarySwatch.shade50,
            title: const Text('Comments'),
            subtitle: const Text(
              'Tap to see comments',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
