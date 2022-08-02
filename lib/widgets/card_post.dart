import 'package:flutter/material.dart';
import '../models/post.dart';

class CardPost extends StatelessWidget {
  final Post post;
  const CardPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 18),
            ),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
