import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/status_controller.dart';

StatusController statusController = Get.find<StatusController>();
final storage = GetStorage();

class StatusManager {
  String currentStatus() {
    return statusController.status.toString();
  }

  void storeStatus(String status) {
    storage.write('registered', status);
    statusController.updateStatus(status);

    Get.snackbar('Status', 'Status set to $status');
  }

  void toggleStatus() {
    String status = currentStatus();
    if (status == 'registered') {
      storage.write('registered', 'unregistered');
      statusController.updateStatus('unregistered');
    } else {
      storage.write('registered', 'registered');
      statusController.updateStatus('registered');
    }
  }
}
