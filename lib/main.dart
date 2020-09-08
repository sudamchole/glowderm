import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glowderm/models/comapny_model.dart';
import 'package:glowderm/notifier.dart';
import 'package:glowderm/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isConnected = false;
  List<Companies> _companyDetails = [];
  TextEditingController controller = new TextEditingController();
  CompanyModel companyModel;
  Services service = Services();
  Exception e;

  Future _loadAccount() async {
    try {
      CompanyModel theCompanyModel = await service.getCompanies(context);
      setState(() {
        companyModel = theCompanyModel;
        _companyDetails=companyModel.companies;
      });
    } catch (err) {
      setState(() {
        e = err;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() {
      _loadAccount();
      //_refreshData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Center(
          child:companyModel == null
            ? showIndicator(e):ListView.builder(
              itemCount: _companyDetails.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return listItem(index);
              }),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  Widget listItem(index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Image.network(
              _companyDetails[index].logoUrl,width: 90,height: 70,),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(_companyDetails[index].company.toUpperCase(),
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w600,),
              ),
              Text(_companyDetails[index].ceo,  textAlign: TextAlign.start,
              ),Divider()
            ],
          ),
        ],
      ),
    );
  }

}
