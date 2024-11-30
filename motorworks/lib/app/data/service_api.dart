import 'package:get/get.dart';
import '../models/service.dart';

class ServiceApi extends GetConnect {
  Future<List<Service>> getServices() async {
    final response = await get('https://example.com/api/services');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching services");
    } else {
      List<dynamic> data = response.body;
      return data.map((item) => Service.fromJson(item)).toList();
    }
  }
}
