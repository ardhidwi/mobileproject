import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/service_controller.dart';

class HomePage extends StatelessWidget {
  final ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Motorworks.app')),
      body: Obx(() {
        if (serviceController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: serviceController.services.length,
          itemBuilder: (context, index) {
            final service = serviceController.services[index];
            return ListTile(
              title: Text(service.name),
              subtitle: Text("Rp. ${service.price.toStringAsFixed(0)}"),
              onTap: () {
                Get.toNamed('/booking', arguments: service);
              },
            );
          },
        );
      }),
    );
  }
}
