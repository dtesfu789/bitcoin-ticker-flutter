import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String bitCoinToCurrency = '?';

  DropdownButton dropDownCreator(List myCurrencyList) {
    List<DropdownMenuItem<String>> dropDownCurrencyList = [];
    for (String currency in myCurrencyList) {
      var myCurrencyDropDownItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownCurrencyList.add(myCurrencyDropDownItem);
    }
    return DropdownButton(
      items: dropDownCurrencyList,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
      value: selectedCurrency,
    );
  }

  CupertinoPicker cupertinoPickerCreator(List myCurrencyList) {
    List<Widget> cupertinoCurrencyList = [];
    for (String currency in myCurrencyList) {
      var myCurrencyItem = Text(currency);
      cupertinoCurrencyList.add(myCurrencyItem);
    }
    return CupertinoPicker(
      children: cupertinoCurrencyList,
      itemExtent: 32,
    );
  }

  void getData() async {
    try {
      CoinData coinData = CoinData();
      double currentCoinRate = await coinData.getCoinData(selectedCurrency);
      setState(() {
        bitCoinToCurrency = currentCoinRate.toStringAsFixed(2);
      });
    } catch (e) {
      print('Our problem is: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid
                ? dropDownCreator(currenciesList)
                : cupertinoPickerCreator(currenciesList),
          ),
        ],
      ),
    );
  }
}
