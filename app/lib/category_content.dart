import 'package:flutter/material.dart';

class CategoryContent extends StatelessWidget {
  const CategoryContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('전체'),
                  onTap: () {
                    
                  },
                ),
                ListTile(
                  title: Text('간장약'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('감기약 · 진통 · 소염제'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('구내염'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('변비약'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('소화성궤양용제'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('소화제'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('정장제'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('제산제'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('지사제'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('치주질환제'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                ListTile(
                  title: Text('해열제'),
                  onTap: () {
                    // 두 번째 목록을 선택하는 핸들링 코드를 추가하세요.
                  },
                ),
                // 추가적인 목록을 나타내기 위해 더 많은 ListTiles를 추가하세요.
              ],
            ),
          ),
        ],
      ),
    );
  }
}
