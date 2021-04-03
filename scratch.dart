import 'package:http/http.dart' as http;

void main() async {
  await getData();
}

Future<dynamic> getData() async {
  var coinData = await http.get(
      "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=F3CCB413-8E5F-410F-B68E-29A2F8449D1C");
  print(coinData.body);
  return coinData;
}
