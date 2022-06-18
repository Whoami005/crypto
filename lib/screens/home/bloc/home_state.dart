part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  inWeb,
}

class HomeState {
  final HomeStatus _status;
  final List<CryptoCurrency> _result;
  final int _countPage;
  final bool _isPaginating;
  final String _url;

  const HomeState({
    required HomeStatus status,
    required List<CryptoCurrency> result,
    required int countPage,
    required bool isPaginating,
    required String url,
  })  : _countPage = countPage,
        _result = result,
        _url = url,
        _isPaginating = isPaginating,
        _status = status;

  String get url => _url;

  bool get isPaginating => _isPaginating;

  int get countPage => _countPage;

  List<CryptoCurrency> get result => _result;

  HomeStatus get status => _status;

  HomeState copyWith({
    HomeStatus? status,
    List<CryptoCurrency>? result,
    int? countPage,
    bool? isPaginating,
    String? url,
  }) {
    return HomeState(
      status: status ?? _status,
      result: result ?? _result,
      countPage: countPage ?? _countPage,
      isPaginating: isPaginating ?? _isPaginating,
      url: url ?? _url,
    );
  }
}
