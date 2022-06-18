
class PaginatedResponse<T> {
  final List<T> _items;
  final Map<String, dynamic> _countPage;

  PaginatedResponse({required List<T> items, required Map<String, dynamic> countPage})
      : _items = items,
        _countPage = countPage;

  List<T> get items => _items;

  Map<String, dynamic> get count => _countPage;
}
