import 'package:coinmarketcap/models/crypto_currency.dart';
import 'package:coinmarketcap/repositories/crypto_currency_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CryptoRepository _cryptoRepository;

  HomeCubit({required CryptoRepository cryptoRepository})
      : _cryptoRepository = cryptoRepository,
        super(const HomeState(
          status: HomeStatus.initial,
          result: [],
          countPage: {},
          isPaginating: false,
        ));

  Future fetch({required int page}) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final result = await _cryptoRepository.fetch(page: page);
    emit(state.copyWith(
      result: result.items,
      countPage: result.count,
      status: HomeStatus.loaded,
    ));
  }

  int page = 0;
  Future<void> paginate() async {
    final lastPage = state.countPage.values.toList()[0] / 30;
    if (state.status == HomeStatus.loaded && page < lastPage.floor()) {
      page++;
      emit(state.copyWith(isPaginating: true));
      final response = await _cryptoRepository.fetch(page: page);
      emit(
        state.copyWith(
          result: state.result..addAll(response.items),
          countPage: response.count,
          isPaginating: false,
        ),
      );
    }
  }

  void onScroll(ScrollMetrics metrics) {
    if (state.status == HomeStatus.loaded) {
      if (!state.isPaginating) {
        final itemsCount = state.result.length;
        final paginatePosition =
            metrics.maxScrollExtent * ((itemsCount - 5) / itemsCount);
        if (metrics.pixels >= paginatePosition) {
          paginate();
        }
      }
    }
  }
}
