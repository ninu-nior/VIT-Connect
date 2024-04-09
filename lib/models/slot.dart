class Slot {
  final String id;
  final String time;


  Slot({
    required this.id,
    required this.time,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      id: json['doctor_id'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
    };
  }
}