<!--ADDING IMAGE TO POST-->

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final DatabaseReference \_database = FirebaseDatabase.instance.reference();
final FirebaseFirestore \_firestore = FirebaseFirestore.instance;
final User? currentUser = FirebaseAuth.instance.currentUser;

Future<void> addNewPost(String content) async {
try {
// Fetch user's data from Firestore
DocumentSnapshot userDoc = await \_firestore.collection('users').doc(currentUser?.uid).get();
String? userName = userDoc.get('fullName');
String? avatarUrl = userDoc.get('avatarUrl');

    if (userName == null || avatarUrl == null) {
      throw Exception('Could not fetch user data.');
    }

    // Add new post with user's name and avatar URL included
    DatabaseReference _newPostRef = _database.child('posts').push();
    await _newPostRef.set(<String, dynamic>{
      'uid': currentUser?.uid,
      'content': content,
      'date': DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
      'userName': userName,
      'avatarUrl': avatarUrl,
    });

} catch (e) {
print('Error while posting: $e');
throw e;
}
}

<!--Original Post List-->

import 'package:flutter/material.dart';
import 'package:stressed_out/models/post.dart';
import 'package:stressed_out/pages/post/post_page.dart';
import 'package:firebase_database/firebase_database.dart';

class PostList extends StatefulWidget {
const PostList({Key? key}) : super(key: key);

@override
State<PostList> createState() => \_PostListState();
}

class \_PostListState extends State<PostList> {
Post post = Post(
username: 'Manikiran, Garela',
profilePictureUrl:
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_xW4R3PKOkKI70cOt0niDrgmkcRFXdHbuAhrhSWEeGt_p7Tv6jTClxI2wxnbDHGtgfE&usqp=CAU',
description: 'Here goes the post description and it could be very long!!!',
createdDate: '2023-07-06',
createdBy: '2023-07-06',
comments: ['Comment 1', 'Comment 2', 'Comment 3'],
);

@override
Widget build(BuildContext context) {
return Scaffold(
//appBar: CommonComponents.tabbedAppBar(context, AppConstants.posts),
body: SingleChildScrollView(
physics: const BouncingScrollPhysics(),
child: Padding(
padding: const EdgeInsets.only(
left: 16.0, right: 16.0, top: 16.0, bottom: 48.0),
child: Column(
children: [
PostPage(post: post),
PostPage(post: post),
PostPage(post: post),
],
),
),
),
/_floatingActionButton: FloatingActionButton(
backgroundColor: AppColors.primarySwatch.shade900,
isExtended: true,
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => CreatePost(),
),
);
},
child: Icon(Icons.add),
),_/
);
}
}
