import 'package:Brikkhayon/auth/forgotpass.dart';
import 'package:Brikkhayon/auth/profilepage.dart';
import 'package:Brikkhayon/auth/signup.dart';
import 'package:Brikkhayon/auth/verifyemail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class SignIn extends StatefulWidget{
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignIn createState() => _SignIn();
}
class _SignIn extends State<SignIn>{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes: {
        'signup' : (context) => SignUp(),
        'forgotpass' : (context) => ForgotPass(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return VerifyEmailPage();
            }
            else{
              return SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
//                    color: Colors.red,
                          alignment: Alignment.topCenter,
                          height: 105,
                          margin: EdgeInsets.only(top: 0.0),
                          child: Image.asset(
                              'assets/images/splash.png'
                          ),
                        ),
                        Container(
//                    color: Colors.amber,
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xff056608),

                            ),
                          ),
                        ),
                        Container(
//                    color: Colors.amber,
                          margin: EdgeInsets.only(top: 40.0,left: 20.0, right: 20.0),
                          child: TextField(
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1,color: Colors.green),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2,color: Colors.green)
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.green,
                              ),
                            ),

                          ),
                        ),
                        Container(
//                    color: Colors.amber,
                          margin: EdgeInsets.only(top: 20.0,left: 20.0, right: 20.0),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1,color: Colors.green),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2,color: Colors.green)
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.green,
                              ),
                            ),

                          ),
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                              width: 500,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff056608),
                              ),
                              child: TextButton(
                                child: Text('Sign In'),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  //padding: EdgeInsets.only(left:205.0,right: 205.0,top:25.0,bottom: 25.0),
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: signIn,
                              )
                          ),
                        ),

                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(top: 30.0,left: 20.0, right: 20.0),
                            child: Text(
                                'Forgot password?'
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, 'forgotpass');
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:15,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 60.0,left: 20.0, right: 20.0),
                          child: Text(
                              'Sign in with'
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.asset('assets/images/google.png'),
                                  margin: EdgeInsets.only(right: 10.0),
                                ),
                                Container(
                                  child: Image.asset('assets/images/facebook.png'),
                                ),
                                Container(
                                  child: Image.asset('assets/images/twitter.png'),
                                  margin: EdgeInsets.only(left: 10.0),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

          }
        ),

      ),
    );
  }

  Future signIn() async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator())
    );
    
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 15.0
      );
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}