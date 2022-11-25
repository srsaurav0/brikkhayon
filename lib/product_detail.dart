import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Color(0xFF056608),
        ),
        title: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.contain,
          height: 50,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(98), // Image radius
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: imageUrl.toString(),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      new Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Money Plant',
                              style: TextStyle(
                                  color: Color(0xFF056608),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text('Uploaded by\nabc@gmail.com',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Color(0xFF056608),
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              '৳ 120',
                              style: TextStyle(
                                color: Color(0xFF056608),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RatingStars(
                            value: 5,
                            starSize: 16,
                            valueLabelColor: Colors.amber,
                            starColor: Colors.amber,
                            valueLabelVisibility: false,
                          ),
                          TextButton.icon(
                            onPressed: null,
                            style: TextButton.styleFrom(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF056608))),
                            label: Text(
                              'Find location',
                              style: TextStyle(color: Color(0xFF056608)),
                            ),
                            icon: Icon(
                              Icons.location_on,
                              size: 20,
                              color: Color(0xFF056608),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      elevation: 40,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding:
                              EdgeInsets.only(left: 15, right: 15, top: 10),
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  'Description',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                          Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15, bottom: 20),
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. but also the leap into electronic typesetting Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFF056608)
                      ),
                      child: TextButton.icon(
                        onPressed: null,
                        style: TextButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        label: Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                        icon: Icon(
                          Icons.add_circle_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
