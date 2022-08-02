import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_interview/routes/app_routes.dart';
import '../../widgets/card_post.dart';
import '../../widgets/refresh_widget.dart';
import '../controllers/home_controller.dart';
import 'details_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Text("List Posts"),
              Expanded(
                child:RefreshWidget(
                      onRefresh:()=>controller.getPosts(),
                      keyRefresh: controller.keyRefresh,
                      child: ListView.builder(
                        itemCount: controller.posts.length,
                        controller: controller.scrollController,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: ()=>Get.toNamed(AppRoutes.details, arguments: [controller.posts[index].id]),
                            child: CardPost(post: controller.posts[index]),
                          ) ;
                        },
                      ),
                    ),
              ),
              Obx(() {
                if(controller.isLoadMoreRunning==true){
                  return const  Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return const Center();
                }
              }
              )

            ],
          ),
        ),
      ),
    );
  }
}