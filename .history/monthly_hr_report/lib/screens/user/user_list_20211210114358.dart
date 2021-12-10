import 'package:flutter/material.dart';
import 'package:monthly_hr_report/models/server_response.dart';
import 'package:monthly_hr_report/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  static final routeName = 'user list';
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Theme.of(context);

    return Scaffold(
      // backgroundColor: theme.backgroundColor,
      appBar: AppBar(title: Text('User List')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('User List...'),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () async {
              ServerResponse serverResponse = await Provider.of<UserProvider>(context, listen: false).getUsers();
              print(serverResponse);
            }, child: Text('Get Users')),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: Text('New User')),
            SizedBox(
              
            )
          ],
        ),
      ),
    );
  }
}
