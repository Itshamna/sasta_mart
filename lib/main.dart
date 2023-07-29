import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sasta_mart/constants/theme.dart';
import 'package:sasta_mart/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:sasta_mart/firebase_helper/firebase_options/firebase_options.dart';
import 'package:sasta_mart/screens/auth_ui/home/home.dart';
import 'package:sasta_mart/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sasta Mart',
      theme: themeData,
      home: StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  HomePage();
          }
          return const SplashScreen();
        },
      ),
    );
  }
}