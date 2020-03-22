import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ifintech/models/ctypto_model.dart';

import 'build_widget.dart';

class CtyptoScrren extends StatefulWidget {
  @override
  _CtyptoScrrenState createState() => _CtyptoScrrenState();
}

class _CtyptoScrrenState extends State<CtyptoScrren> {
  final double _kMarginSize = 16;

  var api = CryptoApi(); 
  var listPrice = List<CryptoModel>();
  var loading = false;

  @override
  void initState() {
    super.initState();
    loading = true;
    getCryptoPrice();
  }

  @override
  Widget build(BuildContext context) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: _kMarginSize),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24)
        )
      ),
      height: 1250,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          loading ?
          Container(
            height: 100,
            child: Center(
              child: Text('Loading...'),
            ),
          )
          :
          ListView.builder(
            padding: EdgeInsets.only(top: 0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listPrice.length,
            itemBuilder: (BuildContext context,int index){
              var item = listPrice[index];
              return HotCard(
                logoPath: item.logoPath,
                title: item.title,
                cryptoName: item.cryptoName,
                currency: item.currency,
                currentPrice: item.currentPrice,
                beforePrice: item.beforePrice,
              );
            })
        ],
      ),

    );
  }

  void getCryptoPrice() async{
    var data = await api.getCryptoPrice();
    setState(() {
      sleep(Duration(milliseconds: 300));
      listPrice = data;
      loading = false;
    });
  }

}


