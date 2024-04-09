class Doctor {
  // final String doctorId;
  final String name;
  final String imageUrl;
  final String venue;
  final String type;
  final String doctorId;

  Doctor(
      {required this.name,
      required this.imageUrl,
      required this.venue,
      required this.type,
      required this.doctorId
      });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      // doctorId: json['doctor_id'],
      name: json['name'],
      imageUrl: json['image_url'],
      venue: json['venue'],
      type: json['type'],
      doctorId: json['doctor_id']
    );
  }
}
