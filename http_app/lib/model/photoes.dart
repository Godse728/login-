

class Hit {
  final int id, likes, comments, userid;
  final String imageURL, user, userImageURl;
  final  hits;

  Hit(
      {required this.id,
      required this.likes,
      required this.comments,
      required this.userid,
      required this.imageURL,
      required this.user,
      required this.userImageURl,
      required this.hits});

  factory Hit.ConvertJsonToHits(Map json) {
    return Hit(
        id: json['id'],
        likes: json['likes'],
        comments: json['comments'],
        userid: json['user_id'],
        imageURL: json['imageURL'],
        user: json['user'],
        userImageURl: json["hits" 'userImageURl'],
        hits: json['hits']);
  }
}
