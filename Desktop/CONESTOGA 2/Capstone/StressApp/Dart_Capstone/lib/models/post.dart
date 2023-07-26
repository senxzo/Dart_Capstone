class Post {
  String? userName;
  //String? profilePictureUrl;
  String? content;
  String? date;
  String? uid;
  List<String>? comments;

  Post({
    this.userName = '',
    /*this.profilePictureUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_xW4R3PKOkKI70cOt0niDrgmkcRFXdHbuAhrhSWEeGt_p7Tv6jTClxI2wxnbDHGtgfE&usqp=CAU',*/
    this.content = '',
    this.date = '',
    this.uid = '',
    this.comments = const [],
  });

  Post.empty()
      : userName = '',
        /*profilePictureUrl =
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_xW4R3PKOkKI70cOt0niDrgmkcRFXdHbuAhrhSWEeGt_p7Tv6jTClxI2wxnbDHGtgfE&usqp=CAU',
        */
        content = '',
        date = '',
        uid = '',
        comments = [];

  Post.fromMap(Map<String, dynamic> map)
      : userName = map['userName'] as String? ?? 'Default username',
        /*profilePictureUrl = map['profilePictureUrl'] as String? ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_xW4R3PKOkKI70cOt0niDrgmkcRFXdHbuAhrhSWEeGt_p7Tv6jTClxI2wxnbDHGtgfE&usqp=CAU',
        */
        content = map['content'] as String? ?? 'Default content',
        date = map['date'] as String? ?? 'Default date',
        uid = map['uid'] as String? ?? 'Default uid',
        comments = map['comments'] != null
            ? List<String>.from(map['comments'].map((x) => x.toString()))
            : <String>[] {
    print('Constructing post with map: $map');
  }

  static Post createPostFromMap(Map<String, dynamic> value) {
    try {
      print('Creating post with map: $value');
      return Post.fromMap(Map<String, dynamic>.from(value));
    } catch (error) {
      print('Error creating post: $error');
      print('Failed map: $value');
      return Post.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      /*'profilePictureUrl': profilePictureUrl,*/
      'content': content,
      'date': date,
      'uid': uid,
      'comments': comments,
    };
  }
}
