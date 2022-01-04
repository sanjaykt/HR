import 'package:flutter/material.dart';
import 'package:monthly_hr_report/commons/constants.dart';
import 'package:monthly_hr_report/screens/home/home_screen.dart';
import 'package:monthly_hr_report/screens/user/user_details.dart';
import 'package:provider/provider.dart';
import '../../models/server_response.dart';
import '../../providers/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  static final routeName = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ThemeData theme;
  AuthProvider _authProvider;
  String employeeId;
  String password;

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Container(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildHeadingText(),
              SizedBox(height: 5),
              _buildUsernameTextFormField(),
              SizedBox(height: 15),
              _buildPasswordTextFormField(),
              SizedBox(height: 40),
              _buildLoginButton(),
              SizedBox(height: 30),
              _buildRegisterButton(),
              SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(
                        context, HomeScreen.routeName);
                  },
                  child: Text('Skip')),
              SizedBox(height: 30),
              ElevatedButton(
                child: Container(
                  child: Text('Test backend'),
                ),
                onPressed: () async {
                  Uri uri = Uri.parse(Constants.SERVER);
                  http.Response response = await http.get(uri);
                  if (response.statusCode == 200) {
                    var responseJson = json.decode(response.body);
                    print(responseJson);
                    // ServerResponse serverResponse = ServerResponse.fromJson(responseJson);
                    // print(serverResponse.data);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadingText() {
    return Padding(
      padding: EdgeInsets.only(top: 100, bottom: 40),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'HR Monthly Report',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsernameTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      // initialValue: 'user',
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(
          Icons.person,
          // color: kOnBackgroundColor,
        ),
        labelText: 'Employee Id',
        hintText: 'Employee Id',
        filled: true,
        // fillColor: kPrimaryColor200,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'please enter username address';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        employeeId = value.trim();
      },
    );
  }

  Widget _buildPasswordTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      // initialValue: 'amma',
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(
          Icons.lock,
          // color: kOnSurfaceColor,
        ),
        labelText: 'Password',
        hintText: 'Password',
        filled: true,
        // fillColor: kPrimaryColor200,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'please enter password';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        password = value.trim();
      },
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        child: Text(
          'Login',
          style: TextStyle(letterSpacing: 2),
        ),
        onPressed: () async {
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();
          ServerResponse serverResponse =
          await _authProvider.login(employeeId, password);
          if (serverResponse.status == SUCCESS) {
//            goToProductScreen();
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
          } else {
            print(serverResponse.message);
          }
        },
      ),
    );
  }

//
//  goToProductScreen() {
//    Future.delayed(Duration(milliseconds: 500), () => Navigator.popAndPushNamed(context, ProductListScreen.routeName));
//  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        color: theme.primaryColorLight,
        padding: EdgeInsets.all(15),
        child: Text(
          'Register',
          style: TextStyle(letterSpacing: 2),
        ),
        onPressed: () {
          Navigator.pushNamed(context, UserDetails.routeName);
        },
      ),
    );
  }
}
