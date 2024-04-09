import 'package:get/get.dart';
import 'package:vit_connect_plus/features/healthcare/screens/book_appointment_screen.dart';

class AppointmentController extends GetxController {
  void goToBookAppointment(String name,String type, String venue,String imageUrl,String doctorId) {
    Get.to(DoctorAppointmentPage(
      type: type,
      doctorName: name,
      doctorId: doctorId,
      imageUrl: imageUrl,
      venue: venue,
    ));
  }
}
