import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/login_form_field_card.dart';
import 'package:workshop/presentation/presentation_export.dart';
import 'package:workshop/shared/app_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop/shared/app_styles.dart';

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
  bool loading = true;

  @override
  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
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
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Login and Register Page',
                          style: AppStyles().whiteBold),
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
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: <Widget>[
                          kShboxH20,
                          Container(),
                          _authMode == AuthMode.Signup
                              ? CustomFormField(
                                  labelText: 'Username',
                                  inputType: TextInputType.text,
                                  onSaved: _user.name,
                                  prefixIcon: Icons.person,
                                  validator1: 'Display Name is required',
                                  validator2:
                                      'Display Name must be betweem 5 and 12 characters',
                                )
                              : Container(),
                          kShboxH12,
                          CustomFormField(
                            labelText: 'Email',
                            inputType: TextInputType.emailAddress,
                            onSaved: _user.email,
                            prefixIcon: Icons.email,
                            validator1: 'Email is required',
                            validator2: 'Please enter a valid email address',
                          ),
                          kShboxH12,
                          CustomFormField(
                            labelText: 'Password',
                            inputType: TextInputType.name,
                            onSaved: _user.password,
                            prefixIcon: Icons.lock,
                            hideText: _isHidden,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: _togglePasswordView,
                            ),
                            input: _passwordController,
                            validator1: 'Password is required',
                            validator2:
                                'Password must be betweem 5 and 20 characters',
                          ),
                          kShboxH12,
                          _authMode == AuthMode.Signup
                              ? CustomFormField(
                                  labelText: 'Confirm Password',
                                  inputType: TextInputType.name,

                                  prefixIcon: Icons.lock,
                                  hideText: _isHidden,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: _toggleConfPasswordView,
                                  ),

                                  // input: _passwordController,
                                  validator1: 'Password do not match',
                                )
                              : Container(),
                          kShboxH30,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonTheme(
                                minWidth: 100.w,
                                child: RaisedButton(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    ' ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
                                    style: TextStyle(
                                        fontSize: 20.sp, color: Colors.black),
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
                                minWidth: 100.w,
                                child: RaisedButton(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(10.0),
                                  onPressed: () => _submitForm(),
                                  child: Text(
                                      _authMode == AuthMode.Login
                                          ? 'Login'
                                          : 'Signup',
                                      style: AppStyles().boldText),
                                ),
                              ),
                            ],
                          ),
                          kShboxH16,
                          //_authMode == AuthMode.Login?

                          //: Container(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: RaisedButton(
                        elevation: 0,
                        color: Colors.blue,
                        onPressed: () {
                          // foodNotifier.currentFood = null;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminLogin(
                                    // isUpdating: false,
                                    )),
                          );
                        },
                        child: Text(
                          'Admin Login',
                          style: TextStyle(color: Colors.white70),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
