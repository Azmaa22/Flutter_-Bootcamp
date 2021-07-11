import 'dart:convert';

import 'package:http/http.dart' as http;

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

class CoinData {
/* Level 01

String baseUrl = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apiKey=0DD9ED01-A89E-4A82-A213-EC548C9FD2AB';
  Future getCoinData() async{
    var url = Uri.parse(baseUrl);
    http.Response response =await http.get(url);
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);

      return data;
    }else{
      print(response.body);
    }
  }*/


/* Level 02

String baseUrl='https://rest.coinapi.io/v1/exchangerate/BTC/';
  String apiKey='0DD9ED01-A89E-4A82-A213-EC548C9FD2AB';
  Future getCoinData(String currency) async{
     var url = Uri.parse("$baseUrl$currency?apiKey=$apiKey");
     http.Response response =await http.get(url);
     if(response.statusCode == 200){
       var data = jsonDecode(response.body);

       return data;
     }else{
       print(response.body);
     }
   }*/

  String baseUrl='https://rest.coinapi.io/v1/exchangerate';
  String apiKey='0DD9ED01-A89E-4A82-A213-EC548C9FD2AB';
  Future getCoinData(String selectedCurrency) async{
    Map<String, String> cryptoPrices = {};
  for (String crypto in cryptoList) {
    //Update the URL to use the crypto symbol from the cryptoList
    String requestURL =
        '$baseUrl/$crypto/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['rate'];
      //Create a new key value pair, with the key being the crypto symbol and the value being the lastPrice of that crypto currency.
      cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
  return cryptoPrices;
  }

}
