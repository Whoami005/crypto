part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
}

class HomeState {
  final HomeStatus _status;
  final List<CryptoCurrency> _result;
  final int _countPage;
  final bool _isPaginating;

  const HomeState({
    required HomeStatus status,
    required List<CryptoCurrency> result,
    required int countPage,
    required bool isPaginating,
  })  : _countPage = countPage,
        _result = result,
        _isPaginating = isPaginating,
        _status = status;

  bool get isPaginating => _isPaginating;

  int get countPage => _countPage;

  List<CryptoCurrency> get result => _result;

  HomeStatus get status => _status;

  HomeState copyWith({
    HomeStatus? status,
    List<CryptoCurrency>? result,
    int? countPage,
    bool? isPaginating,
  }) {
    return HomeState(
      status: status ?? _status,
      result: result ?? _result,
      countPage: countPage ?? _countPage,
      isPaginating: isPaginating ?? _isPaginating,
    );
  }
}
