import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:workshop/app_api/food_api.dart';
import 'package:workshop/app_model/user.dart';
import 'package:workshop/app_notifier/auth_notifier.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  User _user = User();
  bool _isHidden = true;
  bool _isHide = true;

  @override
  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
    super.initState();
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    if (_authMode == AuthMode.Login) {
      login(_user, authNotifier);
    } else {
      signup(_user, authNotifier);
    }
  }

  Widget _buildDisplayNameField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: "Username",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 18, color: Colors.black),
      cursorColor: Colors.grey,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Display Name is required';
        }

        if (value.length < 5 || value.length > 12) {
          return 'Display Name must be betweem 5 and 12 characters';
        }

        return null;
      },
      onSaved: (String value) {
        _user.name = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.black,
          ),
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.grey)),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 18, color: Colors.black),
      cursorColor: Colors.grey,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      onSaved: (String value) {
        _user.email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          prefixIcon: Icon(Icons.lock, color: Colors.black),
          suffixIcon: IconButton(
            icon: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: _togglePasswordView,
          ),
          labelText: "Password",
          labelStyle: TextStyle(color: Colors.grey)),
      style: TextStyle(fontSize: 18, color: Colors.black),
      cursorColor: Colors.grey,
      obscureText: _isHidden,
      controller: _passwordController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        }

        if (value.length < 5 || value.length > 20) {
          return 'Password must be betweem 5 and 20 characters';
        }

        return null;
      },
      onSaved: (String value) {
        _user.password = value;
      },
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isHide ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: _toggleConfPasswordView,
          ),
          labelText: "Confirm Password",
          labelStyle: TextStyle(color: Colors.grey)),
      style: TextStyle(fontSize: 18, color: Colors.black),
      cursorColor: Colors.white,
      obscureText: _isHide,
      validator: (String value) {
        if (_passwordController.text != value) {
          return 'Passwords do not match';
        }

        return null;
      },
    );
  }

  _toggleConfPasswordView() {
    setState(() {
      _isHide = !_isHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
//              gradient: LinearGradient(
//                  begin: Alignment.topRight,
//                  end: Alignment.bottomLeft,
//                  colors: [Colors.green, Colors.red])
              ),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
//                    child: Image.asset(
//                      'assets/logo.png',
//                      height: 50,
//                      width: 50,
//                      fit: BoxFit.fill,
//                    ),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Login and Register Page',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Dancing',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Container(),
                          _authMode == AuthMode.Signup
                              ? _buildDisplayNameField()
                              : Container(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildEmailField(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildPasswordField(),
                          SizedBox(
                            height: 10,
                          ),
                          _authMode == AuthMode.Signup
                              ? _buildConfirmPasswordField()
                              : Container(),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonTheme(
                                minWidth: 100,
                                child: RaisedButton(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    ' ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _authMode = _authMode == AuthMode.Login
                                          ? AuthMode.Signup
                                          : AuthMode.Login;
                                    });
                                  },
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 100,
                                child: RaisedButton(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(10.0),
                                  onPressed: () => _submitForm(),
                                  child: Text(
                                    _authMode == AuthMode.Login
                                        ? 'Login'
                                        : 'Signup',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
