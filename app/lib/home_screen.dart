import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gpt_pill_03/home_content.dart';
import 'package:gpt_pill_03/search_data.dart';
import 'package:gpt_pill_03/category_content.dart';
import 'package:gpt_pill_03/camera_screen.dart';

class HomeScreen extends StatefulWidget {
  final CameraDescription camera;

  const HomeScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeContent(searchData: SearchData()), // searchData를 여기에 전달
    const CategoryContent(),
  ];

  final searchData = SearchData(); // SearchData 인스턴스 생성

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          '약올림',
          style: TextStyle(
              color: Color.fromARGB(255, 62, 196, 66), fontSize: 26.0, fontFamily: 'SoyoBold'),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상 (홈 버튼을 회색으로)
        selectedItemColor: Color.fromARGB(255, 62, 196, 66), // 선택된 아이템 색상 (카테고리 버튼을 보라색으로)
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '카테고리',
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 70, // 원하는 크기로 조절
        height: 70, // 원하는 크기로 조절
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 62, 196, 66),
        ),
        child: IconButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraScreen(camera: widget.camera),
              ),
            );
          },
          icon: Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 40, // 아이콘 크기를 조절
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
