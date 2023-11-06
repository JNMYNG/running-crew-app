import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:running_app/post_provider.dart';

class AddPostScreen extends StatefulWidget {
  final bool isRecruitment;

  AddPostScreen({required this.isRecruitment});

  @override

  _AddPostScreenState createState() => _AddPostScreenState();
}
class _AddPostScreenState extends State<AddPostScreen> {
  String _maxText = '...';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();
  String _selectedLocation = '';


  @override
  void initState() {
    super.initState();
    // 다른 초기화 코드

    // _maxController에 리스너 추가
    _maxController.addListener(() {
      setState(() {
        _maxText = _maxController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isRecruitment ? '크루 개설' : '추천 크루 게시물 추가',
        ),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double screenWidth = constraints.maxWidth;
            final double textScaleFactor = screenWidth < 600 ? 1.0 : 1.5;
            final double buttonWidth = screenWidth < 600 ? 450.0 : 500.0;
            final double buttonHeight = screenWidth < 600 ? 60.0 : 100.0;
            final double fontSize = screenWidth < 600 ? 30.0 : 40.0;

            String inputfixed;
            return Container(
              margin: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_pin, size: 40,),
                      SizedBox(width: 10,),
                      Text('지역', style: TextStyle(fontSize: 40 * textScaleFactor, fontWeight: FontWeight.bold),),
                      SizedBox(width: 30 * textScaleFactor,),
                      Text(_selectedLocation, style: TextStyle(fontSize: 30 * textScaleFactor),),
                    ],
                  ),
                  SizedBox(height: 20 * textScaleFactor,),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          minimumSize: Size(430, buttonHeight),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: _showLocationDialog,
                        child: Text('지역 찾기', style: TextStyle(fontSize: fontSize),),
                      ),
                    ],
                  ),
                  SizedBox(height: 10 * textScaleFactor,),
                  TextFormField(
                    controller: _titleController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: '모임이름',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30 * textScaleFactor,),
                  TextFormField(
                    controller: _contentController,
                    maxLines: 15,
                    decoration: InputDecoration(
                      labelText: '모임에 대해 설명해주세요',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10 * textScaleFactor,),
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 40,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '정원',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),


                  TextFormField(
                    controller: _maxController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: '최대정원(300)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newText) {
                      // onChanged 콜백에서 _maxText 업데이트
                      setState(() {
                        _maxText = newText;
                      });

                      // Provider를 사용하여 _maxText 업데이트
                      final postProvider = Provider.of<PostProvider>(context, listen: false);
                      postProvider.updateMaxText(newText);
                    },
                  ),

                  SizedBox(height: 30 * textScaleFactor,),
                  Text('카카오톡 오픈채팅 URL', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
                  TextFormField(
                    controller: _urlController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: '카카오톡 오픈채팅 URL',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 50 * textScaleFactor,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          minimumSize: Size(300, 80),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        onPressed: () {
                          final postProvider = Provider.of<PostProvider>(context, listen: false);
                          if (widget.isRecruitment) {
                            postProvider.addRecruitmentPost(
                              Post(_titleController.text, _contentController.text),
                            );
                          } else {
                            postProvider.addRecommendationPost(
                              Post(_titleController.text, _contentController.text),
                            );
                          }

                          // 최대정원 값을 업데이트
                          postProvider.updateMaxText(_maxText);

                          Navigator.pop(context);
                        },
                        child: Text('크루 만들기', style: TextStyle(fontSize: 40)),
                      ),

                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showLocationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('지역 선택'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('서울'),
                onTap: () {
                  setState(() {
                    _selectedLocation = '서울';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('인천'),
                onTap: () {
                  setState(() {
                    _selectedLocation = '인천';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('대전'),
                onTap: () {
                  setState(() {
                    _selectedLocation = '대전';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}