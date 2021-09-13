import 'package:flutter/material.dart';
import 'package:workshop/presentation/presentation_export.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Email",
            prefixIcon: Icon(Icons.email)),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _email = value;
        },
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Password",
            prefixIcon: Icon(Icons.email)),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _password = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffF5591F), Color(0xffF2861E)],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100))),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                      right: 105,
                      child: Text(
                        "Admin Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Container(
                          height: 150, child: Image.asset("assets/logo.png")),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildEmail(),
                    _buildPassword(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    Center(
                      child: RaisedButton(
                        elevation: 0,
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }

                          _formKey.currentState.save();

                          if (_email == 'email' && _password == 'password') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminPannel()));
                          }
                        },
                        child: Text("Admin Login"),
                        color: Colors.white70,
                      ),
                    )
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
