import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BannerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double _kAppBarHeight = 50 + MediaQuery.of(context).padding.top;
    double _kPaddingTitle = MediaQuery.of(context).padding.top + 20;

    /*return Placeholder(
      color: Colors.red,
      fallbackHeight: _kAppBarHeight,

    );*/

   return Container(
      height: _kAppBarHeight,
      child: Padding(
        padding: EdgeInsets.only(top: _kPaddingTitle),
        child: Text(
            'I FINTECH',
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      )
    );
  }
}


class ControlMenu extends StatelessWidget {
  final bool visible;
  final Function onPressed;
  final Color buttonColor;
  final Widget title;

  const ControlMenu({Key key, this.onPressed, this.buttonColor, this.title, this.visible}) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {

    double _kButtonWidth = (MediaQuery.of(context).size.width / 2) - 24;

    var _iconActive = 
      Container(
        width: _kButtonWidth,
        child: Center(
          child: Image(
            image: AssetImage('icons/crown.png'),
            width: 25,
          ),
        ),
      );

    var _buttonGroup = GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        width: _kButtonWidth,
        child: Center(
          child: title,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        visible == true ? _iconActive : Container(height: 25),
        Container(
          height: 40,
          child: _buttonGroup,
        )
      ],
    );
  }
}

class HotCard extends StatelessWidget {
  final String logoPath;
  final String title;
  final String cryptoName;
  final double currentPrice;
  final String currency;
  final double beforePrice;

  const HotCard({Key key, this.currentPrice, this.currency, this.beforePrice, this.logoPath, this.cryptoName, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white70
      ),
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(0.1, 1),
                blurRadius: 1
              )
            ]
          ),
          child: _buildCryptoItem(context)
        ),
      ),
    );
  }

  Widget _buildCryptoItem(BuildContext context){

    final formatter = NumberFormat('#,###.00');

    String _changeValue = '';
    if(currentPrice >= beforePrice){
      _changeValue = '+$currency ${formatter.format(currentPrice - beforePrice)}';
    }else{
      _changeValue = '-$currency ${formatter.format(beforePrice - currentPrice)}';
    }

    var _cryptoNameWidget =   Container(
      width: 150,
      child: Row(
        children: <Widget>[
          SizedBox(width: 8),
          Image(
            image: AssetImage(logoPath),
            width: 40,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.w800
               ),
              ),
              Text(
              cryptoName ?? '',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w300
              ),
            ),
            ],
          )
        ],
      ),
    );

    var _priceWidget =  Container(
          margin: EdgeInsets.only(right: 8),
          height: 60,
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '$currency  ${formatter.format(beforePrice)}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey[400],
                  fontSize: 16,
                  fontWeight: FontWeight.bold    
                ),
              ),
              Text(
                '$currency  ${formatter.format(currentPrice)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold    
                ),
              ),
              Text(
                _changeValue,
                style: TextStyle(
                  color: currentPrice >= beforePrice ?
                  Colors.green : Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        );

    var _intoWidget = Icon(
      currentPrice >= beforePrice ? Icons.arrow_upward : Icons.arrow_downward,
      color: currentPrice >= beforePrice ? Colors.green : Colors.red,
    );

     return Row(
      children: <Widget>[
       _cryptoNameWidget,
        Expanded(child: _intoWidget),
        _priceWidget
      ],
    );
  }
}


class StockCard extends StatelessWidget {
  final String title;
  final double currentPrice;
  final String currency;
  final double beforePrice;

  const StockCard({Key key, this.title, this.currentPrice, this.currency, this.beforePrice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white70
      ),
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(0.1, 1),
                blurRadius: 1
              )
            ]
          ),
          child: _buildStockItem(context)
        ),
      ),
    );
  }


   Widget _buildStockItem(BuildContext context){

    final formatter = NumberFormat('#,###.00');

    String _changeValue = '';
    if(currentPrice >= beforePrice){
      _changeValue = '+$currency ${formatter.format(currentPrice - beforePrice)}';
    }else{
      _changeValue = '-$currency ${formatter.format(beforePrice - currentPrice)}';
    }

    var _cryptoNameWidget =   Container(
      width: 150,
      child: Row(
        children: <Widget>[
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.w800
               ),
              ),            
            ],
          )
        ],
      ),
    );

    var _priceWidget =  Container(
          margin: EdgeInsets.only(right: 8),
          height: 60,
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '$currency  ${formatter.format(beforePrice)}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey[400],
                  fontSize: 16,
                  fontWeight: FontWeight.bold    
                ),
              ),
              Text(
                '$currency  ${formatter.format(currentPrice)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold    
                ),
              ),
              Text(
                _changeValue,
                style: TextStyle(
                  color: currentPrice >= beforePrice ?
                  Colors.green : Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        );

    var _intoWidget = Icon(
      currentPrice >= beforePrice ? Icons.arrow_upward : Icons.arrow_downward,
      color: currentPrice >= beforePrice ? Colors.green : Colors.red,
    );

     return Row(
      children: <Widget>[
       _cryptoNameWidget,
        Expanded(child: _intoWidget),
        _priceWidget
      ],
    );
  }


}

