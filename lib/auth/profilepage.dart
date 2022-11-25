import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 720,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, -1),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/coverimage.png',
                              ).image,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    //color: Colors.yellow,
                                    child: IconButton(
                                      iconSize: 22,
                                      color: Colors.white,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(Icons.arrow_back),

                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // color: Colors.yellow,
                                    child: IconButton(
                                      iconSize: 22,
                                      color: Colors.white,
                                      onPressed: () {

                                      },
                                      icon: Icon(Icons.refresh),

                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Align(
                              alignment: AlignmentDirectional(0, 0.01),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.12, .7),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.85,
                                      height: MediaQuery.of(context).size.height * 0.8,
                                      decoration: BoxDecoration(
                                        color:
                                        Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 6,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 2),
                                            spreadRadius: 4,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(0, -0.98),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    //color: Colors.yellow,
                                                    child: IconButton(
                                                      iconSize: 25,
                                                      color: Colors.black,
                                                      onPressed: () {

                                                      },
                                                      icon: Icon(Icons.edit),

                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    // color: Colors.yellow,
                                                    child: IconButton(
                                                      iconSize: 25,
                                                      color: Colors.black,
                                                      onPressed: () {

                                                      },
                                                      icon: Icon(Icons.settings),

                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(0, -0.72),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //color: Colors.yellow,
                                                  child: Text(
                                                    'Dabbrata',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(0, -0.63),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //color: Colors.yellow,
                                                  child: Text(
                                                    'This is your bio field.Please set your bio.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(0, -0.51),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.email,
                                                    color: Colors.black87,
                                                    size: 18.0,
                                                    //semanticLabel: 'Text to announce in accessibility modes',
                                                  ),
                                                ),

                                                Container(
                                                  //color: Colors.yellow,
                                                  child: Text(
                                                    'das1807109@stud.kuet.ac.bd',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(0, -0.45),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0,top: 13),
                                                  child: Icon(
                                                    Icons.location_pin,
                                                    color: Colors.black87,
                                                    size: 18.0,
                                                    //semanticLabel: 'Text to announce in accessibility modes',
                                                  ),
                                                ),

                                                Container(
                                                  // padding: EdgeInsets.only(bottom: 30),
                                                  //color: Colors.yellow,
                                                  child: Text(
                                                    'Kuet road - 9208, fullbarigate, Khulna',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(0, -0.27),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      //color:Colors.red,
                                                      padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8),
                                                      //margin: EdgeInsets.only(top: 20),
                                                      //color: Colors.yellow,
                                                      child: Text(
                                                        'Plant details :',
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),


                                              Align(
                                                alignment: AlignmentDirectional(0, 0),

                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      //color:Colors.green,
                                                      height: 35,

                                                      margin: EdgeInsets.only(bottom: 5),

                                                      child: TextButton(
                                                        child: Text('Choose a photo\n'),
                                                        onPressed: () async {
                                                          var picked = await FilePicker.platform.pickFiles();

                                                          if (picked != null) {
                                                            print(picked.files.first.name);
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
                                                      child: Container(
                                                        child: SizedBox(
                                                          height: 52,
                                                          child: TextField(

                                                            obscureText: true,
                                                            decoration: InputDecoration(
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(width: 1,color: Colors.black87),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(width: 2,color: Colors.black87)
                                                              ),
                                                              contentPadding: EdgeInsets.all(10),
                                                              labelText: "Plant's name",
                                                              labelStyle: TextStyle(
                                                                color: Colors.black87,
                                                              ),
                                                            ),

                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
                                                      child: Container(
                                                        child: SizedBox(
                                                          height:52,
                                                          child: TextField(
                                                            obscureText: true,
                                                            decoration: InputDecoration(
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(width: 1,color: Colors.black87),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(width: 2,color: Colors.black87)
                                                              ),
                                                              contentPadding: EdgeInsets.all(10),
                                                              labelText: 'Address',
                                                              labelStyle: TextStyle(
                                                                color: Colors.black87,
                                                              ),
                                                            ),

                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
                                                      child: Container(
                                                        child: SizedBox(
                                                          height:52,
                                                          child: TextField(

                                                            obscureText: false,
                                                            decoration: InputDecoration(
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(width: 1,color: Colors.black87),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(width: 2,color: Colors.black87)
                                                              ),
                                                              contentPadding: EdgeInsets.all(10),
                                                              labelText: 'Price',
                                                              labelStyle: TextStyle(
                                                                color: Colors.black87,
                                                              ),
                                                            ),

                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
                                                      child: Container(
                                                        height:85,
                                                        child: TextField(

                                                          keyboardType: TextInputType.multiline,
                                                          maxLines: null,
                                                          //obscureText: true,
                                                          decoration: InputDecoration(

                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(width: 1,color: Colors.black87),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(width: 2,color: Colors.black87)
                                                            ),
                                                            labelText: 'About plant',
                                                            labelStyle: TextStyle(
                                                              color: Colors.black87,
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    ),

                                                    Padding(
                                                      //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                      padding: EdgeInsets.all(8.0),
                                                      child: Container(
                                                          width: 550,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5 ),
                                                            color: Color(0xff056608),
                                                          ),
                                                          child: TextButton(
                                                            child: Text('Upload'),
                                                            style: TextButton.styleFrom(
                                                              primary: Colors.white,
                                                              //padding: EdgeInsets.only(left:205.0,right: 205.0,top:25.0,bottom: 25.0),
                                                              textStyle: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              print('changed');
                                                            },
                                                          )
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                    ),
                                  ),

                                ],

                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.04, -0.85),
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  color:
                                  Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/banner-1.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(75),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                //color: Colors.yellow,
                child: Text(
                  'Your Plants',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5,),

              //scroll view

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 240.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: imgList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
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
                                        'Two Gold Rings',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      subtitle: Text('\$200',
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
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
