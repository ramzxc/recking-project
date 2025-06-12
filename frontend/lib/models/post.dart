// class Post {
//   final int id;
//   final String username;
//   final String content;
//   final String location;
//   final List<String> images;
//   final DateTime createdAt;

//   Post({
//     required this.id,
//     required this.username,
//     required this.content,
//     required this.location,
//     required this.images,
//     required this.createdAt,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       username: json['username'],
//       content: json['content'],
//       location: json['location'],
//       images: List<String>.from(json['images']),
//       createdAt: DateTime.parse(json['created_at']),
//     );
//   }
// }

class Post {
  final String username;
  final String userAvatar;
  final DateTime createdAt;
  final String content;
  final List<String> images;
  final String location;

  Post({
    required this.username,
    required this.userAvatar,
    required this.createdAt,
    required this.content,
    required this.images,
    required this.location,
  });
}
