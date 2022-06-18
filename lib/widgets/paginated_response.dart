class PaginatedResponse<T> {
  final List<T> _items;
  final int _countPage;

  PaginatedResponse({required List<T> items, required int countPage})
      : _items = items,
        _countPage = countPage;

  List<T> get items => _items;

  int get count => _countPage;
}
