import 'package:flutter/material.dart';
import 'package:gpt_pill_03/item_detail_page.dart';
import 'package:gpt_pill_03/search_data.dart';

class SearchResults extends StatelessWidget {
  final SearchData searchData;

  const SearchResults({Key? key, required this.searchData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final results = searchData.searchItems;

    if (results.isEmpty) {
      // 검색 결과가 없을 때 사용자에게 메시지를 표시할 수 있습니다.
      return Center(child: Text("검색 결과가 없습니다."));
    }

    return ListView(
  children: results.map((item) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.description),
      onTap: () {
        // 해당 아이템의 정보를 다른 페이지로 전달하고 이동
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(item: item),
          ),
        );
      },
    );
  }).toList(),
)
;
  }
}
