// lib/models/place.dart

class Place {
  final String title;
  final String image;
  final String? subtitle;
  final String? rating;

  Place({
    required this.title,
    required this.image,
    this.subtitle,
    this.rating,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      title: json['title'],
      image: json['image'],
      subtitle: json['subtitle'],
      rating: json['rating'],
    );
  }
}
