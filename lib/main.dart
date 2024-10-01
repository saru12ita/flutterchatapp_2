/*
import 'package:dexkorchatapp/features/app/splash_screen/splash_screen.dart';
import 'package:dexkorchatapp/features/user_auth/presentation/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

late Size mq;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBOoaAFgJFM61w1KTANyUFJbOBX00nGmPI",
        appId: "1:166433443473:android:1484c26cba7c285e11b930",
        messagingSenderId: "166433443473",
        projectId: "wechatapp-7c0e7",
        // Your web Firebase co9nfig options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dexkor WeChat',
      home: SplashScreen(
        child: LoginPage(),
      ),
    );
  }
}
*/

import 'package:dexkorchatapp/features/app/splash_screen/splash_screen.dart';
import 'package:dexkorchatapp/features/user_auth/presentation/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

late Size mq;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for Web and Mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBOoaAFgJFM61w1KTANyUFJbOBX00nGmPI",
        appId:
            "1:166433443473:web:1484c26cba7c285e11b930", // Update appId for Web
        messagingSenderId: "166433443473",
        projectId: "wechatapp-7c0e7",
        authDomain: "wechatapp-7c0e7.firebaseapp.com", // Important for web
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dexkor WeChat',
      home: SplashScreen(
        child: LoginPage(),
      ),
    );
  }
}
