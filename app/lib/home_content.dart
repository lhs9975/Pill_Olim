import 'package:flutter/material.dart';
import 'package:gpt_pill_03/search_data.dart';
import 'package:gpt_pill_03/search_results.dart';

class HomeContent extends StatefulWidget {
  final SearchData searchData;

  const HomeContent({Key? key, required this.searchData}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            onChanged: (query) {
              if (query.isEmpty) {
                // 검색 쿼리 문자열이 비어 있으면 검색 결과를 클리어합니다.
                widget.searchData.searchItems.clear();
              } else {
                // 그렇지 않으면 검색 결과를 업데이트합니다.
                widget.searchData.filterItems(query);
              }
              setState(() {}); // 검색 결과 업데이트를 화면에 반영
            },
            decoration: InputDecoration(
              hintText: '검색...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: SearchResults(searchData: widget.searchData),
        ),
      ],
    );
  }
}
