import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/booking_controller.dart';
import '../../controllers/history_controller.dart';
import '../../models/service.dart';
import '../../models/booking.dart';

class BookingPage extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());
  final HistoryController historyController = Get.put(HistoryController());
  final Service service = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking ${service.name}')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Pilih Tanggal'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (pickedDate != null) {
                  bookingController.setBookingDate(pickedDate.toString());
                }
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Buat Booking baru berdasarkan data inputan
                var newBooking = Booking(
                  date: bookingController.bookingDate.value,
                  serviceType: service.name,
                );
                
                // Tambahkan booking ke riwayat
                historyController.addBooking(newBooking);

                // Navigasi kembali setelah booking
                Get.back();
              },
              child: Text('Pesan'),
            ),
            Obx(() => Text("Tanggal yang Dipilih: ${bookingController.bookingDate.value}")),
          ],
        ),
      ),
    );
  }
}
