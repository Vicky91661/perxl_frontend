import 'package:flutter/material.dart';
import 'package:pexllite/screens/home.dart';
// import 'package:pexllite/screens/login.dart';
// import 'package:pexllite/screens/otp.dart';
// import 'package:pexllite/screens/taskHome.dart';
// import './screens/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/welcome.dart';
import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  String phoneNumber = "6734985934";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home:  AuthCheck(),
    );
  }
}


// class AuthCheck extends StatefulWidget {
//   const AuthCheck({super.key});

//   @override
//   _AuthCheckState createState() => _AuthCheckState();
// }

// class _AuthCheckState extends State<AuthCheck> {
//   bool? isAuthenticated;

//   @override
//   void initState() {
//     super.initState();
//     checkAuthentication();
//   }

//   // Check if the user is authenticated
//   Future<void> checkAuthentication() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool? authStatus = prefs.getBool("isAuthenticated");
//     setState(() {
//       isAuthenticated = authStatus ?? false; // defaults to false if null
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Show loading screen while checking authentication
//     if (isAuthenticated == null) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     // Navigate based on authentication status
//     return isAuthenticated! ? HomeScreen() : WelcomeScreen();
//   }
// }

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool? isAuthenticated;

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  // Check if JWT token is present
  Future<void> checkAuthentication() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("jwtToken");

    // Consider user authenticated if token exists
    setState(() {
      isAuthenticated = token != null;
    });
  }

  Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("jwtToken", token);
  }
  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("jwtToken");
  }


  @override
  Widget build(BuildContext context) {
    // Show loading screen while checking authentication
    if (isAuthenticated == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Navigate based on authentication status
    return isAuthenticated! ? HomeScreen() : WelcomeScreen();
  }
}