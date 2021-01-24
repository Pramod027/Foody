//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:workshop/screens/authenticate/auth_state.dart';
//import 'package:workshop/screens/home/home_api.dart';
//import 'package:workshop/screens/pages/nav_page.dart';
//import 'package:workshop/screens/sign_up/sign_up.dart';
//import 'package:workshop/services/auth_service.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//class LoginScreen extends StatefulWidget {
//  @override
//  _LoginScreenState createState() => _LoginScreenState();
//}
//
//class _LoginScreenState extends State<LoginScreen> {
//  final _formKey = GlobalKey<FormState>();
//  bool _passwordVisible = false;
//  TextEditingController _email = TextEditingController();
//  TextEditingController _password = TextEditingController();
//
//  @override
//  void initState() {
//    _passwordVisible = false;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Consumer(
//      builder: (context, watch, child) {
//        final user = watch(userProvider).state;
//        return Scaffold(
//            backgroundColor: Colors.white,
//            body: SafeArea(
//              child: SingleChildScrollView(
//                child: Container(
//                  child: Form(
//                    key: _formKey,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          height: 300,
//                          decoration: BoxDecoration(
//                              image: DecorationImage(
//                                  image: AssetImage(
//                                      'assets/images/background.png'),
//                                  fit: BoxFit.fill)),
//                          child: Stack(
//                            children: <Widget>[
//                              Positioned(
//                                  left: 30,
//                                  width: 80,
//                                  height: 200,
//                                  child: Container(
//                                    decoration: BoxDecoration(
//                                        image: DecorationImage(
//                                            image: AssetImage(
//                                                'assets/images/light-1.png'))),
//                                  )),
//                              Positioned(
//                                  left: 140,
//                                  width: 80,
//                                  height: 150,
//                                  child: Container(
//                                    decoration: BoxDecoration(
//                                        image: DecorationImage(
//                                            image: AssetImage(
//                                                'assets/images/light-2.png'))),
//                                  )),
//                              Positioned(
//                                  right: 40,
//                                  top: 40,
//                                  width: 80,
//                                  height: 150,
//                                  child: Container(
//                                    decoration: BoxDecoration(
//                                        image: DecorationImage(
//                                            image: AssetImage(
//                                                'assets/images/clock.png'))),
//                                  )),
//                              Positioned(
//                                  child: Container(
//                                margin: EdgeInsets.only(top: 50),
//                                child: Center(
//                                  child: Text(
//                                    "Login",
//                                    style: TextStyle(
//                                        color: Colors.white,
//                                        fontSize: 40,
//                                        fontWeight: FontWeight.bold),
//                                  ),
//                                ),
//                              ))
//                            ],
//                          ),
//                        ),
//                        Padding(
//                          padding: EdgeInsets.all(30.0),
//                          child: Column(
//                            children: <Widget>[
//                              Container(
//                                padding: EdgeInsets.all(5),
//                                decoration: BoxDecoration(
//                                    color: Colors.white,
//                                    borderRadius: BorderRadius.circular(10),
//                                    boxShadow: [
//                                      BoxShadow(
//                                          color:
//                                              Color.fromRGBO(143, 148, 251, .2),
//                                          blurRadius: 20.0,
//                                          offset: Offset(0, 10))
//                                    ]),
//                                child: Column(
//                                  children: <Widget>[
//                                    Container(
//                                      padding: EdgeInsets.all(8.0),
//                                      decoration: BoxDecoration(
//                                          border: Border(
//                                              bottom: BorderSide(
//                                                  color: Colors.grey[100]))),
//                                      child: TextFormField(
//                                        controller: _email,
//                                        validator: (value) {
//                                          return value.isEmpty
//                                              ? 'Enter an email'
//                                              : null;
//                                        },
//                                        decoration: InputDecoration(
//                                            border: InputBorder.none,
//                                            hintText: "Email or Phone number",
//                                            hintStyle: TextStyle(
//                                                color: Colors.grey[400])),
//                                      ),
//                                    ),
//                                    Container(
//                                      padding: EdgeInsets.all(8.0),
//                                      child: TextFormField(
//                                        controller: _password,
//                                        validator: (value) {
//                                          return value.length < 6
//                                              ? 'Enter a password 6+ chars long'
//                                              : null;
//                                        },
//                                        obscureText: !_passwordVisible,
//                                        decoration: InputDecoration(
//                                            border: InputBorder.none,
//                                            suffixIcon: IconButton(
//                                              icon: Icon(
//                                                // Based on passwordVisible state choose the icon
//                                                _passwordVisible
//                                                    ? Icons.visibility
//                                                    : Icons.visibility_off,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: () {
//                                                // Update the state i.e. toogle the state of passwordVisible variable
//                                                setState(() {
//                                                  _passwordVisible =
//                                                      !_passwordVisible;
//                                                });
//                                              },
//                                            ),
//                                            hintText: "Password",
//                                            hintStyle: TextStyle(
//                                                color: Colors.grey[400])),
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              ),
//                              SizedBox(
//                                height: 30,
//                              ),
//                              InkWell(
//                                onTap: () async {
//                                  final email = _email.text;
//                                  final password = _password.text;
//                                  if (_formKey.currentState.validate()) {
//                                    final user = await AuthService
//                                        .signInWithEmailAndPassword(
//                                            email, password);
//                                    if (user != null) {
//                                      context.read(userProvider).state = user;
//                                      Navigator.pushReplacement(
//                                          context,
//                                          MaterialPageRoute(
//                                              builder: (context) => Home()));
//                                    }
//                                  }
//                                },
//                                child: Container(
//                                  height: 50,
//                                  decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(10),
//                                      gradient: LinearGradient(colors: [
//                                        Color.fromRGBO(143, 148, 251, 1),
//                                        Color.fromRGBO(143, 148, 251, .6),
//                                      ])),
//                                  child: Center(
//                                    child: Text(
//                                      "Login",
//                                      style: TextStyle(
//                                          color: Colors.white,
//                                          fontWeight: FontWeight.bold),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                              SizedBox(
//                                height: 50,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  Text(
//                                    "Forgot Password?",
//                                    style: TextStyle(
//                                        color:
//                                            Color.fromRGBO(143, 148, 251, 1)),
//                                  ),
//                                  FlatButton(
//                                    onPressed: () {
//                                      Navigator.pushReplacement(
//                                          context,
//                                          MaterialPageRoute(
//                                              builder: (context) =>
//                                                  Register()));
//                                    },
//                                    child: Text(
//                                      'SignUp',
//                                      style: TextStyle(
//                                          color:
//                                              Color.fromRGBO(143, 148, 251, 1)),
//                                    ),
//                                  )
//                                ],
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  IconButton(
//                                      icon: SvgPicture.asset(
//                                        'assets/facebook.svg',
//                                        color: Colors.blue,
//                                        height: 20,
//                                      ),
//                                      onPressed: () async {}),
//                                  IconButton(
//                                    icon: SvgPicture.asset(
//                                      'assets/google.svg',
//                                      height: 20,
//                                    ),
//                                    onPressed: () async {
//                                      final user =
//                                          await AuthService.signInWithGoogle();
//                                      if (user != null) {
//                                        context.read(userProvider).state = user;
//                                        Navigator.pushReplacement(
//                                            context,
//                                            MaterialPageRoute(
//                                                builder: (context) =>
//                                                    NavagationPage()));
//                                      } else {
//                                        print('error logging in');
//                                      }
//                                    },
//                                  ),
//                                ],
//                              )
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ));
//      },
//    );
//  }
//}
