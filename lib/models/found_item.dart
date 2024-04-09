class FoundItem {
  final String contact;
  final String dateFound;
  final String foundId;
  final String imageUrl;
  final String name;
  final String place;
  final String userId;

  FoundItem({
    required this.contact,
    required this.dateFound,
    required this.foundId,
    required this.imageUrl,
    required this.name,
    required this.place,
    required this.userId,
  });

  factory FoundItem.fromJson(Map<String, dynamic> json) {
    return FoundItem(
      contact: json['contact'].toString(),
      dateFound: json['date_found'].toString(),
      foundId: json['found_id'],
      imageUrl: json['image_url'],
      name: json['name'],
      place: json['place'],
      userId: json['user_id'],
    );
  }
}