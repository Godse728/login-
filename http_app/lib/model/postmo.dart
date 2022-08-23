class Post {
  final int userId;
  final int id;
  final String title, body;

  Post(
    {required this.userId,
    required this.id,
    required this.title,
    required this.body});

    static Post covertJsonToPost(Map json) {
return Post(
  userId: json['userId'],
 id: json['id'], 
 title: json['title'],
 body: json['body']
 );
    }
}