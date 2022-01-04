import 'package:flutter/material.dart';
import 'package:monthly_hr_report/models/user.dart';
import 'package:monthly_hr_report/providers/user_provider.dart';
import 'package:monthly_hr_report/screens/login/login_screen.dart';

class UserDetails extends StatefulWidget {
  static final routeName = 'user_details';

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();
  ThemeData theme;
  TextEditingController _usernameCtrl = TextEditingController();
  TextEditingController _firstnameCtrl = TextEditingController();
  TextEditingController _lastnameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _passwordConfirmCtrl = TextEditingController();

  User _user = User();
  UserProvider _userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: (Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              _buildFirstnameTextFormField(),
              SizedBox(height: 15),
              _buildLastnameTextFormField(),
              SizedBox(height: 15),
              _buildEmailTextFormField(),
              SizedBox(height: 15),
              _buildEmployeeIdTextFormField(),
              SizedBox(height: 15),
              _buildPasswordTextFormField(),
              SizedBox(height: 15),
              _buildPasswordConfirmTextFormField(),
              SizedBox(height: 35),
              _buildRegisterButton()
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildFirstnameTextFormField() {
    return TextFormField(
      enabled: true,
      keyboardType: TextInputType.text,
      controller: _firstnameCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        // fillColor: kPrimaryColor200,
        hintText: 'first name',
        labelText: 'first name',
        prefixIcon: Icon(
          Icons.person_outline,
          // color: theme.iconTheme.color,
        ),
        suffixIcon: Icon(
          Icons.edit,
          // color: theme.iconTheme.color,
        ),
        suffixStyle: TextStyle(color: Colors.green),
      ),
      validator: (String value) {
        value = _usernameCtrl.text.trim();
        if (value.isEmpty) {
          return 'please enter first name';
        } else {
          return null;
        }
      },
      onSaved: (String value) async {
        _user.firstName = _firstnameCtrl.text.trim();
      },
    );
  }

  Widget _buildEmailTextFormField() {
    return TextFormField(
      enabled: true,
      keyboardType: TextInputType.text,
      controller: _emailCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        // fillColor: kPrimaryColor200,
        hintText: 'officialEmail',
        labelText: 'officialEmail',
        prefixIcon: Icon(
          Icons.person_outline,
          // color: theme.iconTheme.color,
        ),
        suffixIcon: Icon(
          Icons.edit,
          // color: theme.iconTheme.color,
        ),
        suffixStyle: TextStyle(color: Colors.green),
      ),
      validator: (String value) {
        value = _emailCtrl.text.trim();
        if (value.isEmpty) {
          return 'Please enter email';
        } else {
          return null;
        }
      },
      onSaved: (String value) async {
        _user.officialEmail = _emailCtrl.text.trim();
      },
    );
  }

  Widget _buildLastnameTextFormField() {
    return TextFormField(
      enabled: true,
      keyboardType: TextInputType.text,
      controller: _lastnameCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        // fillColor: kPrimaryColor200,
        hintText: 'last name',
        labelText: 'last name',
        prefixIcon: Icon(
          Icons.person_outline,
          // color: theme.iconTheme.color,
        ),
        suffixIcon: Icon(
          Icons.edit,
          // color: theme.iconTheme.color,
        ),
        suffixStyle: TextStyle(color: Colors.green),
      ),
      validator: (String value) {
        value = _lastnameCtrl.text.trim();
        if (value.isEmpty) {
          return 'please enter last name';
        } else {
          return null;
        }
      },
      onSaved: (String value) async {
        _user.lastName = _lastnameCtrl.text.trim();
      },
    );
  }
  Widget _buildEmployeeIdTextFormField() {
    return TextFormField(
      enabled: true,
      keyboardType: TextInputType.text,
      controller: _usernameCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        // fillColor: kPrimaryColor200,
        hintText: 'Employee Id',
        labelText: 'Employee Id',
        prefixIcon: Icon(
          Icons.person_outline,
          // color: theme.iconTheme.color,
        ),
        suffixIcon: Icon(
          Icons.edit,
          // color: theme.iconTheme.color,
        ),
        suffixStyle: TextStyle(color: Colors.green),
      ),
      validator: (String value) {
        value = _usernameCtrl.text.trim();
        if (value.isEmpty) {
          return 'please enter employee Id';
        } else {
          return null;
        }
      },
      onSaved: (String value) async {
        _user.employeeId = _usernameCtrl.text.trim();
      },
    );
  }

  Widget _buildPasswordTextFormField() {
    return TextFormField(
      enabled: true,
      obscureText: true,
      keyboardType: TextInputType.text,
      controller: _passwordCtrl,
      initialValue: null,
      // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        // fillColor: kPrimaryColor200,
        hintText: 'password',
        labelText: 'password',
        prefixIcon: Icon(
          Icons.lock,
          // color: theme.iconTheme.color,
        ),
        suffixIcon: Icon(
          Icons.edit,
          // color: theme.iconTheme.color,
        ),
      ),
      validator: (String value) {
        value = _passwordCtrl.text.trim();
        if (value.isEmpty) {
          return 'Please enter password';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _user.password = _passwordCtrl.text.trim();
      },
    );
  }

  Widget _buildPasswordConfirmTextFormField() {
    return TextFormField(
      enabled: true,
      obscureText: true,
      keyboardType: TextInputType.text,
      controller: _passwordConfirmCtrl,
      // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        // fillColor: kPrimaryColor200,
        hintText: ('Confirm password'),
        labelText: ('Confirm password'),
        prefixIcon: Icon(
          Icons.lock,
          // color: theme.iconTheme.color,
        ),
        suffixIcon: Icon(
          Icons.edit,
          // color: theme.iconTheme.color,
        ),
      ),
      validator: (String value) {
        value = _passwordConfirmCtrl.text.trim();
        if (_passwordCtrl.text.trim() != value) {
          return ('Passwords do not match.');
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        child: Text(
          'Register',
          style: TextStyle(letterSpacing: 2),
        ),
        onPressed: () async {
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();
          String response = await _userProvider.createUser(_user);
          // print(response);
          // if (response == 'success') {
          //   Navigator.popAndPushNamed(context, LoginScreen.routeName);
          // }
        },
      ),
    );
  }
}
