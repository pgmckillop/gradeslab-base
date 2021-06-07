import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StatusController extends GetxController {
  var storage = GetStorage();

  var status = ''.obs;

  @override
  void onInit() {
    status.value = storage.read('registered') ?? 'unregistered';

    super.onInit();
  }

  void updateStatus(String newStatus) {
    status.value = newStatus;
    update();
  }
}
