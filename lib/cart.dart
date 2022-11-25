import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? countControllerValue;

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  int _counterValue = 0;
  int sum = 0;

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
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                child: Text(
                  'Check Out',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF056608),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/moneyPlant.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Money Plant',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Money plant is a beautiful plant. Very easy to manage.',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '৳ $sum',
                                                style: TextStyle(
                                                  color: Color(0xFF056608),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.grey,
                                              child: CounterButton(
                                                loading: false,
                                                onChange: (int val) {
                                                  setState(() {
                                                    _counterValue = val;
                                                    if (_counterValue <= 0) {
                                                      _counterValue = 0;
                                                    }
                                                    sum = _counterValue * 120;
                                                  });
                                                },
                                                count: _counterValue,
                                                countColor: Colors.black,
                                                buttonColor: Colors.black,
                                                progressColor:
                                                Colors.amberAccent,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(left: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Shipping: ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '৳ 70',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF056608),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Total: ',
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
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xFF056608),
                      ),
                      margin: EdgeInsets.only(right: 20,bottom: 7),
                      child: TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/checkout');
                          },
                          child: Text(
                            'Check Out',
                            style: TextStyle(
                                fontSize: 20, color: Colors.white),
                          )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
