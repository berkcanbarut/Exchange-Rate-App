import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'CurrencyUnit.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

Future<CurrencyUnit> currencyConversion() async {
  String url = "http://api.exchangeratesapi.io/v1/latest?access_key=";
  // YOUR API KEY 
  String apiKey = "<YOUR_API_KEY>";
  final response = await http.get(Uri.parse(url + apiKey));

  if (response.statusCode == 200) {
    return CurrencyUnit.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to API request");
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();
  String quantity;
  String currencyFirst;
  String currencySecond;
  Future<CurrencyUnit> exchangeRate;

  @override
  void initState() {
    super.initState();
    currencyFirst = null;
    currencySecond = null;
    quantity = null;
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade600,
              child: Image.asset("assets/img/exchange-rate.png"),
            ),
          ),
          title: Text(
            "Exchange Rate Api",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey.shade600,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: ListView(
                      children: [
                        TextField(
                          controller: myController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          style: TextStyle(
                              color: Colors.blueGrey.shade700, fontSize: 20),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            prefixIcon: Icon(
                              Icons.money,
                              color: Colors.blueGrey.shade700,
                              size: 30,
                            ),
                            errorStyle: TextStyle(color: Colors.red),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Enter Amount",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            labelText: "Currency Conversion",
                            hintStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DropdownButton<String>(
                              itemHeight: 100,
                              icon: Icon(Icons.arrow_downward),
                              items: [
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("USD"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/usd.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "USD",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("EUR"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/euro.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "EUR",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("TRY"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/tr.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "TRY",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("AZN"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/azn.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "AZN",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("BRL"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/brl.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "BRL",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("CHF"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/chf.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "CHF",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("CUP"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/cup.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "CUP",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("JPY"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/jpy.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "JPY",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("RUB"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/rub.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "RUB",
                                ),
                              ],
                              onChanged: (s) {
                                setState(() {
                                  currencyFirst = s;
                                });
                              },
                              hint: Text("Currency"),
                              value: currencyFirst,
                            ),
                            DropdownButton<String>(
                              itemHeight: 100,
                              icon: Icon(Icons.arrow_downward),
                              items: [
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("USD"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/usd.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "USD",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("EUR"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/euro.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "EUR",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("TRY"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/tr.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "TRY",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("AZN"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/azn.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "AZN",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("BRL"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/brl.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "BRL",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("CHF"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/chf.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "CHF",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("CUP"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/cup.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "CUP",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("JPY"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/jpy.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "JPY",
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("RUB"),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/rub.png"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  value: "RUB",
                                ),
                              ],
                              onChanged: (s) {
                                setState(() {
                                  currencySecond = s;
                                });
                              },
                              hint: Text("Currency"),
                              value: currencySecond,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                if (myController.text != ""){
                                  quantity = myController.text;
                                }
                                exchangeRate = currencyConversion();
                              });
                            },
                            padding: EdgeInsets.all(10),
                            color: Colors.orange,
                            child: Text(
                              "Exchange Rate",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        )
                      ],
                    ),
                    // color: Colors.red,
                  )),
              Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 100,
                          width: 350,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blueGrey,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.green.shade200,
                          ),
                          child: FutureBuilder<CurrencyUnit>(
                            future: exchangeRate,
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  currencyFirst != null &&
                                  currencySecond != null &&
                                  quantity != null) {
                                var result = currencyConvert(
                                    snapshot.data.rates,
                                    currencyFirst,
                                    currencySecond,
                                    quantity);
                                return Center(
                                  child: Text(
                                    "${result.toString()}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.redAccent.shade400,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    "Currency Conversion",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.redAccent.shade400,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }
                            },
                          )),
                    ],
                  )),
            ],
          ),
        ));
  }
}

double currencyConvert(Map<String, dynamic> rates, String currencyFirst,
    String currencySecond, String quantity) {
  double rate = rates[currencySecond] / rates[currencyFirst];
  double result = rate * double.parse(quantity.replaceAll(",", "."));
  return result;
}
