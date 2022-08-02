import 'package:flutter/material.dart';
import 'package:job_interview/models/post.dart';
import 'package:get/get.dart';

import '../controllers/post_details_controller.dart';



class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PostDetailsController>(
      builder: (controller)=>(
        Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Details",
                  style: TextStyle(fontSize: 18,color: Colors.red),
                ),
                Text(
                  controller.title.value,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(controller.body.value),
              ],
            ),
          ),
        )
    ),
    );
  }
}
