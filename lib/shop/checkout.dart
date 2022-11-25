import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.topCenter,
                child: Text(
                  'Check Out',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF056608),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Text(
                            'Owner:',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF056608),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 5),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Name: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Saurav Roy',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Address: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Dhanmondi, Dhaka',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: double.infinity,
                          ),
                         // padding: EdgeInsets.only(right: 17),
                          child: Row(
                            children: [
                              Text(
                                'Email: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'roy1807084@stud.kuet.ac.bd',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Phone: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '01765-010710',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    'Use provided email or phone number to know the details of your order.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.map,
                      size: 40,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text('Owner\'s location'))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image:
                            AssetImage('assets/images/drawer-header.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    'Press ‘Place Order’ to confirm your order.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '৳ 430',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF056608),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xFF056608),
                      ),
                      margin: EdgeInsets.only(right: 20),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/checkout');
                          },
                          child: Text(
                            'Check Out',
                            style: TextStyle(
                                fontSize: 20, color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
