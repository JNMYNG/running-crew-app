import 'package:flutter/material.dart';

class ModifyInfo extends StatelessWidget {
  const ModifyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("프로필 수정"),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              ),
              onPressed: () {
                print("완료버튼 클릭");
              },
              child: const Text(
                "완료",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: GestureDetector(
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/black.png'),
                  radius: 50.0,
                ),
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 38.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Text(
              "닉네임",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                hintText: "닉네임",
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[700],
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "지역 설정",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Row(children: [DropdownButton(items: items, onChanged: onChanged)],)
            // dropdownbutton 구현 자리
          ],
        ),
      ),
    );
  }
}
