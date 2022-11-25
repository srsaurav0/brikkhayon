import 'package:flutter/material.dart';
import 'package:Brikkhayon/auth/admin.dart';
import 'package:Brikkhayon/auth/chatbot.dart';
import 'package:Brikkhayon/auth/forgotpass.dart';
import 'package:Brikkhayon/auth/passwordotp.dart';
import 'package:Brikkhayon/auth/profilepage.dart';
import 'package:Brikkhayon/auth/resetpassword.dart';
import 'package:Brikkhayon/auth/searchpage.dart';
import 'package:Brikkhayon/auth/signup.dart';
import 'package:Brikkhayon/shop/checkout.dart';
import 'package:Brikkhayon/auth/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:Brikkhayon/auth/auth.dart';
import 'package:Brikkhayon/blocks/auth_block.dart';
import 'package:Brikkhayon/cart.dart';
import 'package:Brikkhayon/categorise.dart';
import 'package:Brikkhayon/home/home.dart';
import 'package:Brikkhayon/localizations.dart';
import 'package:Brikkhayon/product_detail.dart';
import 'package:Brikkhayon/settings.dart';
import 'package:Brikkhayon/shop/shop.dart';
import 'package:Brikkhayon/wishlist.dart';
import 'package:provider/provider.dart';
import 'auth/signin.dart';

import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final Locale locale = Locale('en');
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock())],
    child: MaterialApp(
      navigatorKey: navigatorKey,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange.shade500,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.lightBlue.shade900),
        fontFamily: locale.languageCode == 'ar' ? 'Dubai' : 'Lato',
      ),
      initialRoute: '/splash_screen',
      // routes: {
      //   'signin': (context) => SignIn(),
      //   'signup': (context) => SignUp()
      // },
      routes: <String, WidgetBuilder>{
        '/splash_screen': (BuildContext context) => SplashScreen(),
        '/': (BuildContext context) => Home(),
        //'/auth': (BuildContext context) => Auth(),
        '/signin': (BuildContext context) => SignIn(),
        '/signup': (BuildContext context) => SignUp(),
        '/forgotpass': (BuildContext context) => ForgotPass(),
        '/passwordotp': (BuildContext context) => PasswordOtp(),
        '/resetpassword': (BuildContext context) => ResetPassword(),
        '/profilepage': (BuildContext context) => HomePageWidget(),
        '/searchpage': (BuildContext context) => SearchPageWidget(),
        '/checkout': (BuildContext context) => Checkout(),
        '/admin': (BuildContext context) => Admin(),
        '/chatbot': (BuildContext context) => MyApp(),
        '/shop': (BuildContext context) => Shop(),
        '/categorise': (BuildContext context) => Categorise(),
        '/wishlist': (BuildContext context) => WishList(),
        '/cart': (BuildContext context) => CartList(),
        '/settings': (BuildContext context) => Settings(),
        '/products': (BuildContext context) => Products()
      },
    ),
  ));
}
