import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_app/provider/internet_provider.dart';
import 'package:login_app/provider/sign_in_provider.dart';
import 'package:login_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import "package:flutter/src/painting/text_style.dart" as ts;

// Code to connect with firebase databases
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA0Q6ESxvyDTBys_jEGkuEofPX74mwCbs4",
            authDomain: "loginapp-87017.firebaseapp.com",
            projectId: "loginapp-87017",
            storageBucket: "loginapp-87017.appspot.com",
            messagingSenderId: "939288879280",
            appId: "1:939288879280:web:55e90537025b14526bdb75",
            measurementId: "G-FREWCBF7Y1"));
  };

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDx24fU-veTw_QttLg5mzgAJiDrYXv1EOM",
//   api key here
      appId: "loginapp-87017",
//  app id here
      messagingSenderId: "939288879280",
// messagingSenderId here
      projectId: "loginapp-87017", // project id here
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => SignInProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => InternetProvider()),
        ),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// // Update the parameter name in the MaterialApp widget
// return MaterialApp(
//   debugShowCheckedModeBanner: false,
//   home: StreamBuilder<User?>(
//     stream: FirebaseAuth.instance.authStateChanges(),
//     builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
//       if (snapshot.hasError)
//       {
//         return Text(snapshot.error.toString());
//       }
//       if (snapshot.connectionState == ConnectionState.active) {
//         if (snapshot.data == null) {
//           return Googlescreen();
//         } else {
//           return LoginPage(
//               userName: FirebaseAuth.instance.currentUser!
//                   .displayName!); // Corrected parameter name
//         }
//       }
//       return Center(child: CircularProgressIndicator());
//     },
//   ),
// );

// class AuthWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     final authService = Provider.of<AuthService>(context);
//     return StreamBuilder<User?>(
//       stream: authService.user,
//       builder: (_, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           final User? user = snapshot.data;
//           return user == null ? LoginPage() : HomePage();
//         } else {
//           return Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//       },
//     );
//   }
// }
