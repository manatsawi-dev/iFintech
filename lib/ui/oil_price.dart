import 'package:flutter/material.dart';

import 'build_widget.dart';
import 'home.dart';

class OilPriceScreen extends StatefulWidget {
  @override
  _OilPriceScreenState createState() => _OilPriceScreenState();
}

class _OilPriceScreenState extends State<OilPriceScreen> {
  final double _kMarginSize = 16;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _kMarginSize),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      //height: 1500,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          HotCard(
            logoPath: 'icons/btc_logo.png',
            title: 'BTC',
            cryptoName: 'Bitcoin',
            currency: 'US',
            currentPrice: 5000.00,
            beforePrice: 4950.00,
          ),
          HotCard(
            logoPath: 'icons/eth_logo.png',
            title: 'ETH',
            cryptoName: 'Ethereum',
            currency: 'US',
            currentPrice: 3550.00,
            beforePrice: 3000.00,
          ),
          HotCard(
            logoPath: 'icons/xrp_logo.png',
            title: 'XRP',
            cryptoName: 'XRP',
            currency: 'US',
            currentPrice: 4800.00,
            beforePrice: 4900.00,
          ),
          HotCard(
            logoPath: 'icons/usdt_logo.png',
            title: 'USDT',
            cryptoName: 'Techer',
            currency: 'US',
            currentPrice: 1000.0,
            beforePrice: 1000.0,
          ),
          HotCard(
            logoPath: 'icons/bsv_logo.png',
            title: 'BSV',
            cryptoName: 'Bitcoin SV',
            currency: 'US',
            currentPrice: 4800.00,
            beforePrice: 4900.00,
          ),
          HotCard(
            logoPath: 'icons/litecoin_logo.png',
            title: 'LTC',
            cryptoName: 'Litecoin',
            currency: 'US',
            currentPrice: 4800.00,
            beforePrice: 4900.00,
          ),
          HotCard(
            logoPath: 'icons/bnb_logo.png',
            title: 'BNB',
            cryptoName: 'Binance Coin',
            currency: 'US',
            currentPrice: 955.10,
            beforePrice: 1000.50,
          ),
          HotCard(
            logoPath: 'icons/xtz_logo.png',
            title: 'XTZ',
            cryptoName: 'Tezos',
            currency: 'US',
            currentPrice: 1000.0,
            beforePrice: 1000.0,
          ),
          HotCard(
            logoPath: 'icons/eos_logo.png',
            title: 'EOS',
            cryptoName: 'EOS',
            currency: 'US',
            currentPrice: 1000.0,
            beforePrice: 1000.0,
          ),
          HotCard(
            logoPath: 'icons/ht_logo.png',
            title: 'HT',
            cryptoName: 'Huobi Token',
            currency: 'US',
            currentPrice: 10000.0,
            beforePrice: 1000.0,
          ),
        ],
      ),
    );
  }
}
