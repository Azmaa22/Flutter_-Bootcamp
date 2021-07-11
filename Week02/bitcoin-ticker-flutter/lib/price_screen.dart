import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';



class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue ;

  bool isWaiting = true;
  List<DropdownMenuItem> getItems(){
    List<DropdownMenuItem<String>> currenciesItems = [];
    for(String currency in currenciesList){

     currenciesItems.add( DropdownMenuItem(
       child: Text(currency),
       value: currency,
     ));
    }
    return currenciesItems;
  }
  DropdownButton<String> getAndroidDropDownBtn(){
    return DropdownButton(
      value: selectedValue,
      items: getItems(),
      onChanged: (value){
        print(value);
        setState(() {
          selectedValue = value;
          getData();
        });
      },
    );
  }
  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedValue = currenciesList[selectedIndex];
          getData();

        });
      },
      children: pickerItems,
    );
  }
  void getData() async {
    //7: Second, we set it to true when we initiate the request for prices.
    isWaiting = true;
    try {
      //6: Update this method to receive a Map containing the crypto:price key value pairs.
      var data = await CoinData().getCoinData(selectedValue);
      //7. Third, as soon the above line of code completes, we now have the data and no longer need to wait. So we can set isWaiting to false.
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }
  Map<String, String> coinValues = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedValue = 'USD';


    getData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CryptoCard(
                  cryptoCurrency: 'BTC',
                  //7. Finally, we use a ternary operator to check if we are waiting and if so, we'll display a '?' otherwise we'll show the actual price data.
                  value: isWaiting ? '?' : coinValues['BTC'],
                  selectedCurrency: selectedValue,
                ),
                CryptoCard(
                  cryptoCurrency: 'ETH',
                  value: isWaiting ? '?' : coinValues['ETH'],
                  selectedCurrency: selectedValue,
                ),
                CryptoCard(
                  cryptoCurrency: 'LTC',
                  value: isWaiting ? '?' : coinValues['LTC'],
                  selectedCurrency: selectedValue,
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS?iOSPicker():getAndroidDropDownBtn(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  //2: You'll need to able to pass the selectedCurrency, value and cryptoCurrency to the constructor of this CryptoCard Widget.
  const CryptoCard({
    this.value,
    this.selectedCurrency,
    this.cryptoCurrency,
  });

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
