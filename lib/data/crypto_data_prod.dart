import 'dart:async';
import 'package:aware_cryptocurrency/data/crypto_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

class ProdCryptoRepository implements CryptoRepository {
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(cryptoUrl);
    final List responseBody = jsonDecode(response.body);
    final statusCode = response.statusCode;
    if(statusCode != 200 || responseBody == null) {
      throw new FetchDataException("An error occured: [Status Code: $statusCode]");
    }

    return responseBody.map((c) => new Crypto.fromMap(c)).toList();
  }

}