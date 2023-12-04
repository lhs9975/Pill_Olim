class SearchItem {
  final String name;
  final String description;

  SearchItem(this.name, this.description);
}

class SearchData {
  final List<SearchItem> allItems = [
    SearchItem('가모텍에스알서방정15mg', '소화기계질환 > 위장관 운동 조절제 > 소화관 운동 조절'),
    SearchItem('Banana', 'yellow fruit'),
    SearchItem('Cherry', 'small, red fruit'),
    // 다른 아이템들을 추가하세요
  ];

  List<SearchItem> searchItems = [];

  void filterItems(String query) {
    searchItems = allItems.where((item) {
      final itemName = item.name.toLowerCase();
      final itemDescription = item.description.toLowerCase();
      final queryLower = query.toLowerCase();
      return itemName.startsWith(queryLower) ||
          itemDescription.startsWith(queryLower);
    }).toList();
  }
}
