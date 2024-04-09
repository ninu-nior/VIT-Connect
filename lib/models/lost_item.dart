class LostItem {
  final String contact;
  final String dateLost;
  final String lostId;
  final String imageUrl;
  final String name;
  final String place;
  final String userId;

  LostItem({
    required this.contact,
    required this.dateLost,
    required this.lostId,
    required this.imageUrl,
    required this.name,
    required this.place,
    required this.userId,
  });

  factory LostItem.fromJson(Map<String, dynamic> json) {
    return LostItem(
      contact: json['contact'].toString(),
      dateLost: json['date_lost'].toString(),
      lostId: json['lost_id'],
      imageUrl: json['image_url'],
      name: json['name'],
      place: json['place'],
      userId: json['user_id'],
    );
  }
}