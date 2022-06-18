import 'dart:convert';

import 'package:coinmarketcap/models/crypto_currency.dart';
import 'package:coinmarketcap/widgets/PaginatedResponse.dart';
import 'package:http/http.dart' as http;

class CryptoRepository {
  Future<PaginatedResponse<CryptoCurrency>> fetch({required int page}) async {
    Uri url = Uri.parse(
        "https://min-api.cryptocompare.com/data/top/mktcapfull?tsym=USD&limit=30&page=$page");
    final response = await http.get(
      url,
      headers: {
        'Apikey':
            'd827af60f4704981295e13baf896c32795d38470e25134a58decbb37fb6fd589',
      },
    );
    print(url);
    if (response.statusCode == 200) {
      final resultJson = json.decode(response.body);
      final List<CryptoCurrency> result = [];
      for (final map in resultJson["Data"]) {
        result.add(CryptoCurrency.fromJson(map));
      }
      return PaginatedResponse(
        items: result,
        countPage: resultJson["MetaData"],
      );
    } else {
      throw Exception("Ошибка сервера");
    }
  }
}
