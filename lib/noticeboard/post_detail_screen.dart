import 'package:flutter/material.dart';
import 'package:running_app/post_provider.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(post.content),
      ),
    );
  }
}
