import 'package:get/get.dart';
import 'package:job_interview/modules/controllers/post_details_controller.dart';


class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailsController());
  }
}