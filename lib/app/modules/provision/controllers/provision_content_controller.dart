import 'package:get/get.dart';

class ProvisionContentController extends GetxController {
  //TODO: Implement ProvisionContentController

  @override
  void onInit() {
    super.onInit();
  }

  RxInt indexActive = 0.obs;

  switchToGSData() {
    indexActive.value = 1;
  }

  switchToRemoteData() {
    indexActive.value = 0;
  }
}
