import 'package:flutter/material.dart';

class Post {
  final String title;
  final String content;

  Post(this.title, this.content);
}

class PostProvider extends ChangeNotifier {
  List<Post> _recruitmentPosts = [];
  List<Post> _recommendationPosts = [];
  List<Post> _fixedPosts=[];

  List<Post> get recruitmentPosts => _recruitmentPosts;
  List<Post> get recommendationPosts => _recommendationPosts;
  List<Post> get fixedPosts => _fixedPosts;

  void addRecruitmentPost(Post post) {
    _recruitmentPosts.add(post);
    notifyListeners();
  }

  void addRecommendationPost(Post post) {
    _recommendationPosts.add(post);
    notifyListeners();
  }
  String _maxText = '...'; // 최대정원 텍스트 초기값 설정

  String get maxText => _maxText;

  void updateMaxText(String newText) {
    _maxText = newText;
    notifyListeners();
  }
}
