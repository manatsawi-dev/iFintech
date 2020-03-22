class StockModel {
  String title;
  String currency;
  double currentPrice;
  double beforePrice;

  StockModel({this.title, this.currency, this.currentPrice, this.beforePrice});

  StockModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    currency = json['currency'];
    currentPrice = json['currentPrice'];
    beforePrice = json['beforePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['currency'] = this.currency;
    data['currentPrice'] = this.currentPrice;
    data['beforePrice'] = this.beforePrice;
    return data;
  }
}

class StockApi {
  var stockData = <StockModel>[
    StockModel(
      title: 'SET',
      currency: 'BTH',
      currentPrice: 1127.24,
      beforePrice: 1044.19,
    ),
    StockModel(
      title: 'SET50',
      currency: 'BTH',
      currentPrice: 756.11,
      beforePrice: 691.99,
    ),
    StockModel(
      title: 'SET100',
      currency: 'BTH',
      currentPrice: 1651.40,
      beforePrice: 1512.46,
    ),
    StockModel(
      title: 'sSET',
      currency: 'BTH',
      currentPrice: 445.33,
      beforePrice: 419.55,
    ),
    StockModel(
      title: 'SETCLMV',
      currency: 'BTH',
      currentPrice: 690.05,
      beforePrice: 628.04,
    ),
    StockModel(
      title: 'SETHD',
      currency: 'BTH',
      currentPrice: 748.05,
      beforePrice: 679.81,
    ),
    StockModel(
      title: 'SETTHSI',
      currency: 'BTH',
      currentPrice: 681.50,
      beforePrice: 626.10,
    ),
    StockModel(
      title: 'SETWB',
      currency: 'BTH',
      currentPrice: 747.90,
      beforePrice: 698.93,
    ),
    StockModel(
      title: 'mai',
      currency: 'BTH',
      currentPrice: 226.36,
      beforePrice: 217.75,
    ),
  ];

  Future<List<StockModel>> getStockPrice() async {
    return stockData;
  }
}
