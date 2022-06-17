class CryptoCurrency {
  CoinInfo? coinInfo;
  Display? display;

  CryptoCurrency({
    this.coinInfo,
    this.display,
  });

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return CryptoCurrency(
      coinInfo: CoinInfo.fromJson(json['CoinInfo']),
      display: Display.fromJson(json['DISPLAY']),
    );
  }
}

class CoinInfo {
  String? id;
  String? name;
  String? fullName;
  String? imageUrl;
  String? url;
  String? algorithm;
  String? proofType;
  String? assetLaunchDate;
  num? maxSupply;
  int? type;

  CoinInfo({
    this.id,
    this.name,
    this.fullName,
    this.imageUrl,
    this.url,
    this.algorithm,
    this.proofType,
    this.assetLaunchDate,
    this.maxSupply,
    this.type,
  });

  factory CoinInfo.fromJson(Map<String, dynamic> json) {
    return CoinInfo(
      id: json['Id'],
      name: json['Name'],
      fullName: json['FullName'],
      imageUrl: json['ImageUrl'],
      url: json['Url'],
      algorithm: json['Algorithm'],
      proofType: json['ProofType'],
      assetLaunchDate: json['AssetLaunchDate'],
      maxSupply: json['MaxSupply'],
      type: json['Type'],
    );
  }
}

class Display {
  USD? usd;

  Display({this.usd});

  factory Display.fromJson(Map<String, dynamic> json) {
    return Display(
      usd: json['USD'] != null ? USD.fromJson(json['USD']) : null,
    );
  }
}

class USD {
  String? price;

  USD({this.price});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['PRICE'];
  }
}
