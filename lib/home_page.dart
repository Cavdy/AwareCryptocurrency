import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.pink,Colors.green,Colors.red];

  @override
  void initState() async {
    super.initState();
    currencies = await getCurrencies();
  }

  Future<List> getCurrencies() async {
    String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
    http.Response response = await http.get(cryptoUrl);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Aware Cryptocurrency'),
      ),
      body: _cryptoWidget(),
    );
  }

  // this is the cryptoWidget
  Widget _cryptoWidget() {
    return new Container(
      child: new Flexible(
        child: new ListView.builder(
          itemCount: currencies.length,
          itemBuilder: (BuildContext context, int index) {
            final Map currency = currencies[index];
            final MaterialColor color = _colors[index % _colors.length];

            return _getListItemUI(currency,color);
          }
        )
      ),
    );
  }

  // this is the cryptoWidget
  
}
