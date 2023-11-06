import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:running_app/post_detail_screen.dart';
import 'package:running_app/post_provider.dart';

import 'add_post_screen.dart';

class RecruitmentCrewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: postProvider.recruitmentPosts.length,
            itemBuilder: (context, index) {
              final post = postProvider.recruitmentPosts[index];
              return Card(
                elevation: 2, // 그림자 설정
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(post: post),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/dog.jpg', width: 100), // 이미지 경로 수정
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                post.content,
                                style: TextStyle(fontSize: 18),
                              ),

                              Row(
                                children: [
                                  Text(
                                    '송파구',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.account_circle),
                                  SizedBox(width: 4),
                                  Consumer<PostProvider>(
                                    builder: (context, postProvider, child) {
                                      return Text(
                                        postProvider.maxText,
                                        // Provider를 통해 _maxText 값을 가져옴
                                        style: TextStyle(fontSize: 13),
                                      );
                                    },
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
              builder: (context) => AddPostScreen(isRecruitment: true),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
