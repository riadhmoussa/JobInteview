import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../config/app_constants.dart';
import '../../models/post.dart';
import '../../services/base_client.dart';
import 'base_controller.dart';



class HomeController extends GetxController with BaseController {
  var posts = <Post>[].obs;
  final keyRefresh = GlobalKey<RefreshIndicatorState>();
  int page = 0;
  final int limit = 10;
  bool hasNextPage = true;
  RxBool isLoadMoreRunning = false.obs;
  late ScrollController scrollController;

  @override
  void onReady(){
    super.onReady();
    getPosts(true);
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()..addListener(_loadMorePosts);
  }


  Future  getPosts(bool showLoader) async {
    if(showLoader) {
      showLoading('Fetching data');
    }
    keyRefresh.currentState?.show();
    posts.clear();
    page = 0;
    hasNextPage= true;
    isLoadMoreRunning.value = false;
    try{
      var response = await BaseClient().get(AppConstants.baseUrl, "?_page=$page&_limit=$limit").catchError(handleError);
      var listPosts = listPostFromJson(response);
      if(listPosts!=null){
        posts.value = listPosts;
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong!');
      }
    }
    if(showLoader) {
      hideLoading();
    }
  }

  void _loadMorePosts() async {
    if (hasNextPage == true &&
        isLoadMoreRunning == false &&
        scrollController.position.extentAfter < 300
    ) {
      isLoadMoreRunning.value = true;
      page += 1;
      try {
        var response = await BaseClient().get(AppConstants.baseUrl, "?_page=$page&_limit=$limit").catchError(handleError);
        var listPosts = listPostFromJson(response);
        if(listPosts.isNotEmpty){
          posts.addAll(listPosts);
        }else{
          hasNextPage= false ;
        }

      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }
      isLoadMoreRunning.value = false;
    }
  }


}