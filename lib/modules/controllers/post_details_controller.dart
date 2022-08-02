import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../models/post.dart';
import '../../services/post_remote_services.dart';

class PostDetailsController extends GetxController {
  dynamic argumentData = Get.arguments;
  RxString title = ''.obs;
  RxString body = ''.obs;


  @override
  void onInit() {
    super.onInit();
    getPost(argumentData[0]);
  }

  Future  getPost(int id) async {
    try{
      var post = await PostRemoteServices().getPost(id);
      if(post!=null){
        print(post.title);
        print(post.body);
        title.value = post.title;
        body.value = post.body;

      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong!');
      }
    }

  }


}