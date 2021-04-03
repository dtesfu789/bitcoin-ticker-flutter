import 'package:http/http.dart' as http;
import 'package:bitcoin_ticker/utility/constants.dart';
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/';

class CoinData {
  Future<double> getCoinData(String selectedCurrency) async {
    var coinData = await http.get("$url$selectedCurrency?apikey=$apiKey");
    print("$url$selectedCurrency?apikey=$apiKey");
    var decodedCoinData = jsonDecode(coinData.body);
    double coinRate = decodedCoinData['rate'];
    return coinRate;
  }
}
