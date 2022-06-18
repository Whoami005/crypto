class USD {
  String? price;

  USD({this.price});

  factory USD.fromJson(Map<String, dynamic> json) {
    return USD(
      price: json['PRICE'],
    );
  }
}