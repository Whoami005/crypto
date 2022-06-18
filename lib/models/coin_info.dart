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