import 'package:get/get.dart';
import '../data/service_api.dart';
import '../models/service.dart';

class ServiceController extends GetxController {
  var services = <Service>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchServices();
  }

  void fetchServices() async {
    try {
      isLoading(true);
      var serviceList = await ServiceApi().getServices();
      services.assignAll(serviceList);
    } finally {
      isLoading(false);
    }
  }
}
