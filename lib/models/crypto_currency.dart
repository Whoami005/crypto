import 'package:coinmarketcap/models/coin_info.dart';
import 'package:coinmarketcap/models/display.dart';

class CryptoCurrency {
  CoinInfo? coinInfo;
  Display? display;

  CryptoCurrency({this.coinInfo, this.display});

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return CryptoCurrency(
      coinInfo:
          json['CoinInfo'] != null ? CoinInfo.fromJson(json['CoinInfo']) : null,
      display:
          json['DISPLAY'] != null ? Display.fromJson(json['DISPLAY']) : null,
    );
  }
}
