class Post {
  final int id;
  final String username;
  final String content;
  final String location;
  final List<String> images;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.username,
    required this.content,
    required this.location,
    required this.images,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      username: json['username'],
      content: json['content'],
      location: json['location'],
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
