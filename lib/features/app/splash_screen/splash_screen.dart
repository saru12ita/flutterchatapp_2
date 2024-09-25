/*
import 'package:dexkorchatapp/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key,this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(
      Duration(seconds:1),(){
        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>widget.child!),(route)=>false);
        
      }
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(" Welcome to Dexkor ChatApp",
        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
*/
import 'package:dexkorchatapp/features/user_auth/presentation/pages/login_page.dart';
import 'package:dexkorchatapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required LoginPage child});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1400),(){
      //exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      //Navigate to home screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {

    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to DexKor WeChat',textAlign: TextAlign.center, // Align text center
          style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)),    
    ),
    body: Stack(children: [
      Positioned(

        top:mq.height*0.15, 
        width:mq.width*0.5,
        right:  mq.width*0.25,
        child: Image.asset("assets/images/icon.png")),
        
        Positioned(
        bottom:mq.height*0.15, 
        width:mq.width,
        
        height: mq.height*0.06,
        child: const Text('DexKor Chat App 🤩',
        textAlign:TextAlign.center,
         style: TextStyle(
          fontSize: 16,color: Colors.black87,
          letterSpacing: .5,
        ),)
        ),
         ]),
    );
  }
}

