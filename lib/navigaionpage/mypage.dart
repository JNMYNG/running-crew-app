import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool isJoinClick = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              print("알림 클릭");
            },
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              print("설정 클릭");
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 사용자 사진
                CircleAvatar(
                  backgroundImage: AssetImage('assets/black.png'),
                  radius: 50.0,
                ),
                SizedBox(
                  width: 30.0,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "닉네임",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "신사동 / 용현동",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30.0,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/modifyinfo');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                  ),
                  child: Text(
                    "프로필 수정",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80.0,
            ),
            Divider(
              color: Colors.grey[900],
              indent: 8,
              endIndent: 8,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isJoinClick = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          "개설 크루",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: !isJoinClick
                                ? Colors.blue[300]
                                : Colors.grey[700],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          height: 2,
                          width: 167,
                          color: !isJoinClick
                              ? Colors.blue[300]
                              : Colors.grey[700],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isJoinClick = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          "가입 크루",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: isJoinClick
                                ? Colors.blue[300]
                                : Colors.grey[700],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          height: 2,
                          width: 167,
                          color:
                              isJoinClick ? Colors.blue[300] : Colors.grey[700],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isJoinClick)
              Container(
                child: const Text("가입 크루 클릭"),
              ),
            if (!isJoinClick)
              Container(
                child: const Text("개설 크루 클릭"),
              ),
          ],
        ),
      ),
    );
  }
}
