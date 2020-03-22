import 'package:flutter/material.dart';
import 'package:ifintech/ui/ctypto.dart';
import 'package:ifintech/ui/stock.dart';
import 'build_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedMenu;
  double _paddingAnimation = 100;
  var controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _selectedMenu = 0;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // const SizedBox _kMarginTop = SizedBox(height: 8);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffbdc3c7), Color(0xff2c3e50)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          children: <Widget>[
            BannerWidget(),
            _buildMenu(context),
            Expanded(child: _buildBody(context))
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
        controller: controller, child: _getScreen(context));
  }

  Widget _getScreen(BuildContext context) {
    if (_selectedMenu == 0) {
      return _getAnimation(context, CtyptoScrren());
    } else if (_selectedMenu == 1)
      return _getAnimation(context, StockScreen());
    /* else if(_selectedMenu == 2)
      return _getAnimation(context, OilPriceScreen());*/
    else
      return Container();
  }

  Widget _getAnimation(BuildContext context, Widget widget) {
    return Column(
      children: <Widget>[_animatedContainer(context), widget],
    );
  }

  Widget _animatedContainer(BuildContext context) {
    setState(() {
      _paddingAnimation = 0;
    });
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: _paddingAnimation,
    );
  }

  Widget _buildMenu(BuildContext context) {
    const double _kMarginSize = 16;
    const SizedBox _kSizeBox = SizedBox(width: 8);

    return Container(
      margin: EdgeInsets.all(_kMarginSize),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ControlMenu(
            visible: _selectedMenu == 0 ? true : false,
            onPressed: () {
              _onPressedMenu(ButtonMenu.Ctypto);
            },
            buttonColor: Colors.orange,
            title: Text('CRYPTO'),
          ),
          _kSizeBox,
          ControlMenu(
            visible: _selectedMenu == 1 ? true : false,
            onPressed: () {
              _onPressedMenu(ButtonMenu.Stock);
            },
            buttonColor: Colors.orange,
            title: Text('STOCK PRICE'),
          ),
          /* _kSizeBox,
           ControlMenu(
            visible: _selectedMenu == 2 ? true: false,
            onPressed: (){
              _onPressedMenu(ButtonMenu.Oil);
            },
            buttonColor: Colors.orange,
            title: Text('OIL PRICE'),
          ),*/
        ],
      ),
    );
  }

  void _onPressedMenu(ButtonMenu btn) {
    controller.jumpTo(0);
    setState(() => _paddingAnimation = 100);
    setState(() => _selectedMenu = btn.index);
  }
}

enum ButtonMenu { Ctypto, Stock, Oil }
