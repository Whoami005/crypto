import 'package:coinmarketcap/models/usd.dart';

class Display {
  USD? usd;

  Display({this.usd});

  factory Display.fromJson(Map<String, dynamic> json) {
    return Display(
      usd: json['USD'] != null ? USD.fromJson(json['USD']) : null,
    );
  }
}