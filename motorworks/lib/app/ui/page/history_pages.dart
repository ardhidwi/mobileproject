import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Servis')),
      body: Obx(() {
        if (historyController.history.isEmpty) {
          return Center(child: Text('Belum ada riwayat servis'));
        }
        return ListView.builder(
          itemCount: historyController.history.length,
          itemBuilder: (context, index) {
            final booking = historyController.history[index];
            return ListTile(
              title: Text(booking.serviceType),
              subtitle: Text(booking.date),
            );
          },
        );
      }),
    );
  }
}
