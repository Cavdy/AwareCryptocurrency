import 'dart:async';
import 'package:aware_cryptocurrency/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    return new Future.value(currencies);
  }

}

var currencies = <Crypto> [
  new Crypto(name: "Bitcoin", priceUsd: "\$6000", percentChange1h: "1.20"),
  new Crypto(name: "Ethereum", priceUsd: "\$500", percentChange1h: "-0.20"),
  new Crypto(name: "Ripple", priceUsd: "\$300", percentChange1h: "1.00"),
];