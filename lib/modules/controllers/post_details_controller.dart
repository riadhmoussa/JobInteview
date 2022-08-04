import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../config/app_constants.dart';
import '../../models/post.dart';
import '../../services/base_client.dart';
import 'base_controller.dart';

class PostDetailsController extends GetxController with BaseController  {
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
      var response = await BaseClient().get(AppConstants.baseUrl,"/$id").catchError(handleError);
      var post = postFromJson(response);
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