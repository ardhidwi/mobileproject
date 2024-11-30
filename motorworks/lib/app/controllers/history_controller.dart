import 'package:get/get.dart';
import '../models/booking.dart';

class HistoryController extends GetxController {
  // Observable list untuk menyimpan riwayat layanan pengguna
  var history = <Booking>[].obs;

  // Menambahkan booking ke dalam riwayat
  void addBooking(Booking booking) {
    history.add(booking);
  }
}
