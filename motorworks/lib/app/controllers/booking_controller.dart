import 'package:get/get.dart';

class BookingController extends GetxController {
  var bookingDate = ''.obs;

  void setBookingDate(String date) {
    bookingDate.value = date;
  }
}
