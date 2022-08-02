import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../models/post.dart';
import '../../services/post_remote_services.dart';



class HomeController extends GetxController {
  var posts = <Post>[].obs;
  final keyRefresh = GlobalKey<RefreshIndicatorState>();
  int page = 0;
  final int limit = 10;
  bool hasNextPage = true;
  RxBool isLoadMoreRunning = false.obs;
  late ScrollController scrollController;


  @override
  void onInit() {
    super.onInit();
    getPosts();
    scrollController = ScrollController()..addListener(_loadMorePosts);

  }


  Future  getPosts() async {
    keyRefresh.currentState?.show();
    posts.clear();
    page = 0;
    hasNextPage= true;
    isLoadMoreRunning.value = false;
    try{
      var list = await PostRemoteServices().getPosts(page,limit);
      if(list!=null){
        posts.value = list;
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong!');
      }
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
        var list = await PostRemoteServices().getPosts(page,limit);
        if(list!.isNotEmpty){
          posts.addAll(list);
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