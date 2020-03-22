class CryptoModel {
  String logoPath;
  String title;
  String cryptoName;
  String currency;
  double currentPrice;
  double beforePrice;

  CryptoModel(
      {this.logoPath,
      this.title,
      this.cryptoName,
      this.currency,
      this.currentPrice,
      this.beforePrice});

  CryptoModel.fromJson(Map<String, dynamic> json) {
    logoPath = json['logoPath'];
    title = json['title'];
    cryptoName = json['cryptoName'];
    currency = json['currency'];
    currentPrice = json['currentPrice'];
    beforePrice = json['beforePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logoPath'] = this.logoPath;
    data['title'] = this.title;
    data['cryptoName'] = this.cryptoName;
    data['currency'] = this.currency;
    data['currentPrice'] = this.currentPrice;
    data['beforePrice'] = this.beforePrice;
    return data;
  }
}

class CryptoApi {
  var cryptoData = <CryptoModel>[
    CryptoModel(
      logoPath: 'icons/btc_logo.png',
      title: 'BTC',
      cryptoName: 'Bitcoin',
      currency: 'US',
      currentPrice: 5000.00,
      beforePrice: 4950.00,
    ),
    CryptoModel(
      logoPath: 'icons/eth_logo.png',
      title: 'ETH',
      cryptoName: 'Ethereum',
      currency: 'US',
      currentPrice: 3550.00,
      beforePrice: 3000.00,
    ),
    CryptoModel(
      logoPath: 'icons/xrp_logo.png',
      title: 'XRP',
      cryptoName: 'XRP',
      currency: 'US',
      currentPrice: 4800.00,
      beforePrice: 4900.00,
    ),
    CryptoModel(
      logoPath: 'icons/usdt_logo.png',
      title: 'USDT',
      cryptoName: 'Techer',
      currency: 'US',
      currentPrice: 1000.0,
      beforePrice: 1000.0,
    ),
    CryptoModel(
      logoPath: 'icons/bsv_logo.png',
      title: 'BSV',
      cryptoName: 'Bitcoin SV',
      currency: 'US',
      currentPrice: 4800.00,
      beforePrice: 4900.00,
    ),
    CryptoModel(
      logoPath: 'icons/litecoin_logo.png',
      title: 'LTC',
      cryptoName: 'Litecoin',
      currency: 'US',
      currentPrice: 4800.00,
      beforePrice: 4900.00,
    ),
    CryptoModel(
      logoPath: 'icons/bnb_logo.png',
      title: 'BNB',
      cryptoName: 'Binance Coin',
      currency: 'US',
      currentPrice: 955.10,
      beforePrice: 1000.50,
    ),
    CryptoModel(
      logoPath: 'icons/xtz_logo.png',
      title: 'XTZ',
      cryptoName: 'Tezos',
      currency: 'US',
      currentPrice: 1000.0,
      beforePrice: 1000.0,
    ),
    CryptoModel(
      logoPath: 'icons/eos_logo.png',
      title: 'EOS',
      cryptoName: 'EOS',
      currency: 'US',
      currentPrice: 1000.0,
      beforePrice: 1000.0,
    ),
    CryptoModel(
      logoPath: 'icons/ht_logo.png',
      title: 'HT',
      cryptoName: 'Huobi Token',
      currency: 'US',
      currentPrice: 10000.0,
      beforePrice: 1000.0,
    ),
  ];

  Future<List<CryptoModel>> getCryptoPrice() async {
    return cryptoData;
  }
}
