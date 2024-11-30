import 'package:get/get.dart';
import '../ui/page/home_page.dart';
import '../ui/page/booking_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/booking', page: () => BookingPage()),
  ];
}
