part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
}

class HomeState {
  final HomeStatus _status;
  final List<CryptoCurrency> _result;

  const HomeState({
    required HomeStatus status,
    required List<CryptoCurrency> result,
  })  : _result = result,
        _status = status;

  List<CryptoCurrency> get result => _result;

  HomeStatus get status => _status;

  HomeState copyWith({
    HomeStatus? status,
    List<CryptoCurrency>? result,
  }) {
    return HomeState(
      status: status ?? _status,
      result: result ?? _result,
    );
  }
}
