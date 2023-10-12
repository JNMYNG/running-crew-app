import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:running_app/post_detail_screen.dart';
import 'package:running_app/post_provider.dart';

import 'add_post_screen.dart';

class RecommendationCrewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: postProvider.recommendationPosts.length,
            itemBuilder: (context, index) {
              final post = postProvider.recommendationPosts[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 50, // CircleAvatar의 크기를 조절하는 부분
                  backgroundImage: AssetImage('assets/your_image.png'), // 이미지 경로 설정
                ),

                title: Text(
                  post.title,
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  post.content,
                  style: TextStyle(fontSize: 30),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailScreen(post: post),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPostScreen(isRecruitment: false),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
