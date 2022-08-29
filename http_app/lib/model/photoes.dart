

class Photos {
  final int id, likes, comments, userid;
  final String imageURL, user, userImageURl;


  Photos(
      {required this.id,
      required this.likes,
      required this.comments,
      required this.userid,
      required this.imageURL,
      required this.user,
      required this.userImageURl,
      });

  static Photos ConvertJsonToPhotos(Map json) {
    return Photos(
        id: json['id'],
        likes: json['likes'],
        comments: json['comments'],
        userid: json['user_id'],
        imageURL: json['imageURL'],
        user: json['user'],
        userImageURl: json['userImageURl'],
        );
  }
}
