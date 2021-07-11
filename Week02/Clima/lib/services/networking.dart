import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  var url;
  NetworkHelper({@required this.url});
  Future getWeatherData() async{

    http.Response response =await http.get(url);
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      print(data['main']['temp']);
      print(data['name']);
      print(data);
      return data;
    }else{
      print(response.body);
    }
  }
}