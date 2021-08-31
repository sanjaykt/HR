import 'package:flutter/material.dart';
import 'package:monthly_hr_report/commons/my_colors.dart';
import 'package:monthly_hr_report/providers/auth_provider.dart';
import 'package:monthly_hr_report/providers/user_provider.dart';
import 'package:monthly_hr_report/screens/home/home_screen.dart';
import 'package:monthly_hr_report/screens/login/login_screen.dart';
import 'package:monthly_hr_report/screens/user/user_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthProvider(), lazy: false),
        ChangeNotifierProvider(create: (ctx) => UserProvider(), lazy: false),
        // Provider(create: (context) => DatabaseProvider(), lazy: false),
        // ChangeNotifierProxyProvider2<AuthProvider, DatabaseProvider,
        //     ProductProvider>(
        //   create: (context) => ProductProvider(),
        //   lazy: false,
        //   update: (context, authProvider, databaseProvider, productProvider) =>
        //   productProvider..update(authProvider, databaseProvider),
        // ),
        // ChangeNotifierProxyProvider<AuthProvider, CartProvider>(
        //   create: (context) => CartProvider(),
        //   lazy: false,
        //   update: (context, authProvider, cartProvider) =>
        //   cartProvider..update(authProvider),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: MyColors.primaryColor,
          accentColor: MyColors.accentColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              bodyText1: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              bodyText2:
              TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          buttonTheme: ButtonThemeData(
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              // side: BorderSide(color: Theme.of(context).accentColor, width: 5),
            ),
            buttonColor: MyColors.accentColor,
            // textTheme: ButtonTextTheme.primary
          ),
          backgroundColor: Colors.grey.shade50,
          cursorColor: Colors.redAccent,
          colorScheme: ColorScheme.light(),
          errorColor: Colors.red,
        ),
        routes: {
          LoginScreen.routeName: (BuildContext context) => LoginScreen(),
          UserDetails.routeName: (BuildContext context) => UserDetails(),
          HomeScreen.routeName: (BuildContext context) => HomeScreen(),
          // AdminHomeScreen.routeName: (BuildContext context) =>
          //     AdminHomeScreen(),
          // ProductListScreen.routeName: (BuildContext context) =>
          //     ProductListScreen(),
          // ProductDetailsScreen.routeName: (BuildContext context) =>
          //     ProductDetailsScreen(),
          // UserProductDetailsScreen.routeName: (BuildContext context) =>
          //     UserProductDetailsScreen(),
          // CartScreen.routeName: (BuildContext context) => CartScreen(),
          // OrderScreen.routeName: (BuildContext context) => OrderScreen(),
          // ShippingAddressScreen.routeName: (BuildContext context) =>
          //     ShippingAddressScreen(),
        },
      ),
    );
  }
}
