import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Brikkhayon/localizations.dart';

import 'package:lottie/lottie.dart';

import 'drawer.dart';
import 'slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1528183429752-a97d0bf99b5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dHJlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xff056608)),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          title: Image.asset(
            'assets/images/splash.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                Navigator.pushNamed(context, '/chatbot');
              },
              color: Color(0xff056608),
            )
          ],
          centerTitle: true,
          elevation: 0,
        ),
        drawer: Drawer(
            child: AppDrawer()
        ),
        body: Container(
          color: Colors.white,

          child: SafeArea(
            top: false,
            left: false,
            right: false,
            child: CustomScrollView(
              // Add the app bar and list of items as slivers in the next steps.
                slivers: <Widget>[
                  // SliverAppBar(
                  //
                  //   brightness: Brightness.light,
                  //   backgroundColor: Colors.white,
                  //   // Provide a standard title.
                  //   // title: Text('asdas'),
                  //   // pinned: true,
                  //   // Allows the user to reveal the app bar if they begin scrolling
                  //   // back up the list of items.
                  //   // floating: true,
                  //   // Display a placeholder widget to visualize the shrinking size.
                  //   flexibleSpace: HomeSlider(),
                  //   // Make the initial height of the SliverAppBar larger than normal.
                  //   expandedHeight: 270,
                  // ),

                  SliverList(
                    // Use a delegate to build items as they're scrolled on screen.
                    delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                          (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Container(
                            height: 250,
                            width: double.infinity,
                            child: HomeSlider(),
                          ),

                          Padding(
                            padding:
                            EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0,bottom: 10),

                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('NEW_PRODUCTS') ?? 'New Products',
                                style: TextStyle(
                                    color: Color(0xff056608),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),



                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            height: 240.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: imgList.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.circular(100),
                                      //
                                      // ),

                                      width: 140.0,
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/products',
                                                arguments: i);
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 160,
                                                child: Hero(
                                                  tag: '$i',
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: i,
                                                    placeholder: (context, url) =>
                                                        Center(
                                                            child:
                                                            CircularProgressIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                    new Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Apple',
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                                subtitle: Text('\TK 200',

                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme.secondary,
                                                        fontWeight:
                                                        FontWeight.w700)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        // boxShadow: [
                                        //   new BoxShadow(
                                        //     offset: Offset(0, 10),
                                        //     blurRadius: 150,
                                        //     color: Color(0xFF0C9869).withOpacity(0.23),
                                        //   ),
                                        // ],
                                      ),

                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 20,

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8.0, left: 8.0, right: 8.0),
                                child: Text('Shop By Category',
                                    style: TextStyle(
                                        color: Color(0xff056608),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ),


                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, top: 8.0, left: 8.0,bottom: 10),
                                child: SizedBox(
                                  height: 35,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff056608)),
                                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(9)),
                                          foregroundColor: MaterialStateProperty.all<Color>(Color(0xff056608)),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25.0),
                                                  side: BorderSide(color: Color(0xff056608))
                                              )
                                          )
                                      ),
                                      child: Text('View All',
                                        style: TextStyle(color: Colors.white,fontSize: 13),
                                      ),

                                      onPressed: () {
                                        Navigator.pushNamed(context, '/categorise');
                                      }),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: Colors.lightGreen,
                          ),

                          Container(
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              padding: EdgeInsets.only(
                                  top: 8, left: 6, right: 6, bottom: 12),
                              children: List.generate(4, (index) {
                                return Container(
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () {
                                        print('Card tapped.');
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height:
                                            (MediaQuery.of(context).size.width /
                                                2) -
                                                70,
                                            width: double.infinity,
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: imgList[index],
                                              placeholder: (context, url) => Center(
                                                  child:
                                                  CircularProgressIndicator()),
                                              errorWidget: (context, url, error) =>
                                              new Icon(Icons.error),
                                            ),
                                          ),
                                          ListTile(
                                              title: Text(
                                                'Two Gold Rings',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Container(

                            width: MediaQuery.of(context).size.width*100,
                            color: Colors.white,
                            child: SingleChildScrollView(
                              //scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    //color: Colors.blue,
                                    height: 200,
                                    width: 110,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 6.0, left: 8.0, right: 8.0, bottom: 10
                                      ),
                                      child: Lottie.asset(
                                          'assets/images/homebottomleft.json'
                                      ),
                                    ),
                                  ),

                                  Container(
                                    //color: Colors.green,
                                    //color: Colors.amber,
                                    height: 200,
                                    width: 120,
                                    //width: MediaQuery.of(context).size.width*40,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 6.0, left: 8.0, right: 8.0, bottom: 10
                                      ),
                                      child: Lottie.asset(
                                          'assets/images/homebottommidle.json'
                                      ),
                                    ),
                                  ),
                                  Container(
                                    //color: Colors.amber,
                                    height: 200,
                                    width: 130,
                                    //width: MediaQuery.of(context).size.width*40,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 6.0, left: 8.0, right: 8.0, bottom: 10
                                      ),
                                      child: Lottie.asset(
                                          'assets/images/homebottomright.json'
                                      ),
                                    ),
                                  ),
                                ],

                              ),
                            ),
                          )
                        ],
                      ),
                      // Builds 1000 ListTiles
                      childCount: 1,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
  Future<bool> _onBackButtonPressed(BuildContext context) async{
    bool? exitApp = await showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Do you want to exit?"),
            actions: <Widget> [
              TextButton(
                onPressed:(){
                  Navigator.of(context).pop(false);
                },
                child: const Text("No"),
              ),
              TextButton(
                onPressed:(){
                  if(Platform.isAndroid) {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  }
                  else{
                    exit(0);
                  }

                },
                child: const Text("Yes"),
              )
            ],
          );
        }
    );
    return exitApp ?? false;
  }
}
