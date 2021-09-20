import 'package:flutter/material.dart';
import 'package:monthly_hr_report/screens/login/login_screen.dart';
import 'package:monthly_hr_report/screens/user/user_list.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('A'), //todo: get the user's name first letter
          ),
          accountName: Text('Account Name'),
          accountEmail: Text('Account Email'),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Users'),
          onTap: () {
            Navigator.popAndPushNamed(context, UserListScreen.routeName);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
        )
      ],
    ));
  }
}
