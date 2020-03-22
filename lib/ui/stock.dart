import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ifintech/models/stock_model.dart';

import 'build_widget.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {

  final double _kMarginSize = 16;

   var api = StockApi(); 
  var listPrice = List<StockModel>();
  var loading = false;

  @override
  void initState() {
    super.initState();
    loading = true;
    getStockPrice();
  }


  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: _kMarginSize),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24)
        )
      ),
      height: 1150,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
           loading ?
          Container(
            height: 100,
            child: Center(
              child: Text('Loading...'),
            ),
          ) :
          ListView.builder(
            padding: EdgeInsets.only(top: 0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listPrice.length,
            itemBuilder: (BuildContext context, int index){
              var item = listPrice[index];
              return StockCard(
                title: item.title,
                currency: item.currency,
                currentPrice: item.currentPrice,
                beforePrice: item.beforePrice,
              );
            }
          )
        ],
      )

    );
  }

  void getStockPrice() async{
    var data = await api.getStockPrice();
    setState(() {
      sleep(Duration(milliseconds: 300));
      listPrice = data;
      loading = false;
    });
  }
}