import 'dart:io';
import 'package:flutter/material.dart';

class ImageDisplayScreen extends StatelessWidget {
  final String imagePath;

  const ImageDisplayScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          '촬영 이미지',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.file(File(imagePath)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // "확인" 버튼을 눌렀을 때의 동작을 여기에 추가하세요.
                    // 예를 들어, 이미지를 저장하거나 화면을 닫을 수 있습니다.
                  },
                  child: Text('확인'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // "취소" 버튼을 눌렀을 때의 동작을 여기에 추가하세요.
                    // 예를 들어, 이미지를 삭제하거나 화면을 닫을 수 있습니다.
                  },
                  child: Text('취소'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
