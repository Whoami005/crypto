part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
}

class HomeState {
  final HomeStatus _status;
  final List<CryptoCurrency> _result;
  final Map<String, dynamic> _countPage;
  final bool _isPaginating;

  const HomeState({
    required HomeStatus status,
    required List<CryptoCurrency> result,
    required Map<String, dynamic> countPage,
    required bool isPaginating,
  })  : _countPage = countPage,
        _result = result,
        _isPaginating = isPaginating,
        _status = status;

  bool get isPaginating => _isPaginating;

  Map<String, dynamic> get countPage => _countPage;

  List<CryptoCurrency> get result => _result;

  HomeStatus get status => _status;

  HomeState copyWith({
    HomeStatus? status,
    List<CryptoCurrency>? result,
    Map<String, dynamic>? countPage,
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
