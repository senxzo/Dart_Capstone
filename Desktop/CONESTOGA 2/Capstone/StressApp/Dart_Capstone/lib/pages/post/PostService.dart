import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:stressed_out/models/network_result.dart';
import 'package:stressed_out/models/post.dart';

final DatabaseReference _database = FirebaseDatabase.instance.reference();
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final User? currentUser = FirebaseAuth.instance.currentUser;

Future<NetworkResult> addNewPost(String content) async {
  NetworkResult nr = NetworkResult();
  try {
    // Fetch user's data from Firestore
    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(currentUser?.uid).get();
    String? userName = userDoc.get('fullName');
    String? profilePictureUrl;

    if (userName == null) {
      nr.message = 'Could not fetch user data.';
      nr.status = false;
      throw Exception('Could not fetch user data.');
    }

    // Check if profilePictureUrl exists in the document, else use default url
    Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
    if (userData != null && userData.containsKey('profilePictureUrl')) {
      profilePictureUrl = userData['profilePictureUrl'];
    } else {
      profilePictureUrl =
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_xW4R3PKOkKI70cOt0niDrgmkcRFXdHbuAhrhSWEeGt_p7Tv6jTClxI2wxnbDHGtgfE&usqp=CAU';
    }

    // Add new post with user's name and profilePictureUrl included
    DatabaseReference _newPostRef = _database.child('posts').push();
    await _newPostRef.set(<String, dynamic>{
      'uid': currentUser?.uid,
      'content': content,
      'date': DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.now()),
      'userName': userName,
      'profilePictureUrl': profilePictureUrl,
    });
    //nr.message = '';
    nr.status = true;
  } catch (e) {
    print('Error while posting: $e');
    //throw e;
    // Log exception.
    nr.message = 'Error while creating post: ${e.toString()}';
    nr.status = false;
    // return false;
  }
  return nr;
}

// Fetch Posts

Future<List<Post>> fetchPosts() async {
  try {
    // Fetch posts from Firebase
    DatabaseEvent event = await _database.child('posts').once();
    DataSnapshot dataSnapshot = event.snapshot;

    // Check if posts exist
    if (dataSnapshot.value != null &&
        dataSnapshot.value is Map<String, dynamic>) {
      // If yes, map the posts to Post model instances
      List<Post> posts = [];
      Map<String, dynamic> postsMap =
          dataSnapshot.value as Map<String, dynamic>;
      postsMap.forEach((key, value) {
        print("Processing post data: $value");
        Post post = Post.fromMap(Map<String, dynamic>.from(value));
        posts.add(post);
      });
      // Return the list of posts
      return posts;
    } else {
      // If no posts exist, return an empty list
      return [];
    }
  } catch (e) {
    print('Error while fetching posts: $e');
    throw e;
  }
}
