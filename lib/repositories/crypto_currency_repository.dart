import 'dart:convert';

import 'package:coinmarketcap/models/crypto_currency.dart';
import 'package:http/http.dart' as http;

class CryptoRepository {
  Uri url = Uri.parse(
      "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=USD");

  Future<List<CryptoCurrency>> fetch() async {
    final response = await http.get(
      url,
      headers: {
        'Apikey':
            'd827af60f4704981295e13baf896c32795d38470e25134a58decbb37fb6fd589',
      },
    );
    if (response.statusCode == 200) {
      final resultJson = json.decode(response.body);
      final List<CryptoCurrency> result = [];
      for (final map in resultJson["Data"]) {
        result.add(CryptoCurrency.fromJson(map));
      }
      return result;
    }else {
      throw Exception("Ошибка сервера");
    }
  }
}
