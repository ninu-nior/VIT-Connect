class Appointment {
  final String doctorName;
  final String userName;
  final String date;
  final String time;

  Appointment({
    required this.doctorName,
    required this.userName,
    required this.date,
    required this.time,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      doctorName: json['doctor_name'],
      userName: json['user_name'],
      date: json['date'].toString(),
      time: json['time'].toString(),
    );
  }
}