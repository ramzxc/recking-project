class Place {
  final String title;
  final String image;
  final String? subtitle;
  final String? rating;
  final String? address;
  final double? latitude;
  final double? longitude;

  Place({
    required this.title,
    required this.image,
    this.subtitle,
    this.rating,
    this.address,
    this.latitude,
    this.longitude,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      title: json['title'] ?? json['name'],  // courseDetail에서 name 필드로 들어올 수도 있음
      image: json['image'] ?? '', // 없어도 되게 처리
      subtitle: json['subtitle'],
      rating: json['rating'],
      address: json['address'],
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['lng'] as num?)?.toDouble(),
    );
  }
}
