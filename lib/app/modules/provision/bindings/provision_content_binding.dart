import 'package:get/get.dart';

import '../controllers/provision_content_controller.dart';

class ProvisionContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvisionContentController>(
      () => ProvisionContentController(),
    );
  }
}
