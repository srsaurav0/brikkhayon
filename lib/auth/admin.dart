import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:Brikkhayon/models/admin_chart.dart';

import '../models/admin_chart_model.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<AdminSeries> data = [
    AdminSeries(year: "Jan", subscribers: 1000, barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    AdminSeries(year: "Feb", subscribers: 2000, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    AdminSeries(year: "Mar", subscribers: 4000, barColor: charts.ColorUtil.fromDartColor(Colors.red)),
    AdminSeries(year: "Apr", subscribers: 3500, barColor: charts.ColorUtil.fromDartColor(Colors.amber)),
    AdminSeries(year: "May", subscribers: 6000, barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color(0xFF056608),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Image.asset(
          'assets/images/splash.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    margin: EdgeInsets.all(20),
                    child: Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text("Users of application by month:", style: TextStyle(fontWeight: FontWeight.bold),)
                          ),
                          Expanded(

                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: AdminChart(
                                data: data,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 20,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/images/users.png',),
                                  ),
                                  iconSize: 130,
                                  onPressed: null,
                                ),
                                Text('Users', style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 20,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/images/plants.png'),
                                  ),
                                  iconSize: 130,
                                  onPressed: null,
                                ),
                                Text('Plants', style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 20,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/images/transaction.png'),
                                  ),
                                  iconSize: 130,
                                  onPressed: null,
                                ),
                                Text('Transactions', style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 20,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                IconButton(
                                    icon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset('assets/images/adminout.png'),
                                    ),
                                    iconSize: 130,
                                    onPressed: (){Navigator.pushNamed(context, '/');}
                                ),
                                Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}