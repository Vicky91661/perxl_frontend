// import 'package:flutter/material.dart';
// import 'package:pexllite/screens/login.dart';
// import 'package:pexllite/screens/registration.dart';
// import '../../../constants.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // Logo at the top
//                 const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Image(
//                     image: AssetImage("assets/images/logo.png"), // Add your logo asset path
//                     height: 150,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Welcome Text
//                 const Text(
//                   "Welcome to Perxl",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: kPrimaryColor,
//                   ),
//                 ),

//                 const SizedBox(height: 40),

//                 // Login Button
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return const LoginScreen();
//                         },
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: kPrimaryColor,
//                     shape: const StadiumBorder(),
//                     minimumSize: const Size(double.infinity, 56),
//                   ),
//                   child: Text(
//                     "Login".toUpperCase(),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Signup Button
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return const RegistrationScreen();
//                         },
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: kPrimaryLightColor,
//                     elevation: 0,
//                     shape: const StadiumBorder(),
//                     minimumSize: const Size(double.infinity, 56),
//                   ),
//                   child: const Text(
//                     "Sign Up",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:pexllite/screens/login.dart';
import 'package:pexllite/screens/registration.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG handling
import '../../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo image
              SvgPicture.asset(
                'assets/images/chat.svg', // Replace with your logo path
                height: 150, // Adjust the size according to your needs
              ),
              const SizedBox(height: 20),
              // Welcome text
              const Text(
                "Welcome to Perxl",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 30),
              // Sign In button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              // Sign Up button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryLightColor,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
