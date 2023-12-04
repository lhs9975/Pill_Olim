import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gpt_pill_03/search_data.dart';
import 'package:path/path.dart';

class ItemDetailPage extends StatelessWidget {
  final SearchItem item;

  ItemDetailPage({super.key, required this.item});

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350, // 이미지의 원하는 폭 설정
                height: 350, // 이미지의 원하는 높이 설정
                child: Image.asset('assets/images/202004270006502.jpg'),
              ),
              Align(
                alignment: Alignment.centerLeft, // 텍스트를 좌측으로 정렬
                child: Text(
                  '제품명: 가모텍에스알서방정15mg\n'
                  '\n'
                  '1) 성분 / 함량\n'
                  '모사프리드시트르산염수화물 15.88mg\n'
                  '\n'
                  '2) 제조 / 수입사\n'
                  '일양약품\n'
                  '\n'
                  '3) 성상\n'
                  '분홍색의 장방형 서방정 필름코팅정제\n'
                  '\n'
                  '4) KPIC 약효분류\n'
                  '소화기계질환 > 위장관 운동 조절제 > 소화관 운동 조절\n'
                  '\n'
                  '5) 효능 / 효과\n'
                  '기능성소화불량으로 인한 소화기증상(속쓰림, 구역, 구토)\n'
                  '\n'
                  '6) 용법 / 용량\n'
                  '- 성인 : 모사프리시드트르산염무수물로서 1일 15mg을 1일 1회 경구투여한다.\n'
                  '- 이 약은 식사를 피하여 공복 상태에서 복용한다.\n'
                  '- 이 약은 서방정 제제이므로 부수거나, 분쇄하거나 또는 씹어서 복용해서는 안되며, 정제 전체를 삼켜서 복용한다.\n'
                  '\n',
                  style: TextStyle(fontSize: 17.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
