import 'package:flutter/material.dart';
import 'package:running_app/post_provider.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title), // Post 제목을 AppBar의 title로 사용
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset('assets/test1.png'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 가입하기 버튼이 눌렸을 때의 동작을 여기에 추가하세요.
              },
              child: Text("가입하기"),
            ),
            SizedBox(height: 20),
            Text(
              post.title, // Post 제목을 출력
              style: TextStyle(fontSize: 50), // 글자 크기를 키움
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                post.content,
                style: TextStyle(fontSize: 18), // 글자 크기를 조정
              ),
            ),
          ],
        ),
      ),
    );
  }
}
