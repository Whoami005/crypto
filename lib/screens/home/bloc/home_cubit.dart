import 'package:coinmarketcap/models/crypto_currency.dart';
import 'package:coinmarketcap/repositories/crypto_currency_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CryptoRepository _cryptoRepository;

  HomeCubit({required CryptoRepository cryptoRepository})
      : _cryptoRepository = cryptoRepository,
        super(const HomeState(status: HomeStatus.initial, result: []));

  Future fetch() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final List<CryptoCurrency> result = await _cryptoRepository.fetch();
    emit(state.copyWith(result: result, status: HomeStatus.loaded));
  }
}
