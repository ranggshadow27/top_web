import 'package:get/get.dart';

import '../controllers/sla_controller.dart';

class SlaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlaController>(
      () => SlaController(),
    );
  }
}
