import 'package:flutter/material.dart';
import 'package:running_crew_app/navigaionpage/modify_info.dart';
import 'package:running_crew_app/util/navigation.dart';
// import 'package:running_crew_app/myApp.dart';

void main() {
  runApp(const MyApp());
}

// myApp.dart 파일에서 flutter/material.dart에 snake_case error가 발생하여 일단 main.dart로 MyApp을 옮김
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/',
      routes: {
        // 하단 네비게이터 구현 함수 => util/navigation.dart 파일에 함수 존재
        '/': (context) => const BottomNavigation(),
        '/modifyinfo': (context) => const ModifyInfo(),
      },
    );
  }
}
