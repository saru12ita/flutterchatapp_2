
import 'package:dexkorchatapp/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:dexkorchatapp/features/user_auth/presentation/pages/home_page.dart';
import 'package:dexkorchatapp/features/user_auth/presentation/pages/login_page.dart';
import 'package:dexkorchatapp/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth =FirebaseAuthService();
  final TextEditingController _usernameController =TextEditingController();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
//var _auth;
 @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text("Signup",style:TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),

          FormContainerWidget(
          controller:_usernameController,
            hintText: "Username",
            isPasswordField: false,
          ),

          const SizedBox(
            height: 30,
          ),
          FormContainerWidget(
           controller:_emailController,
            hintText: "Email",
            isPasswordField: false,
          ),

          const SizedBox(height: 30,),
          FormContainerWidget(
            controller:_passwordController,
            hintText: "Password",
            isPasswordField: true,
          ),
          const SizedBox(height: 30,),
          
GestureDetector(
  onTap: _signUp,
          child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
            child: const Center(
              child: Text("Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold),),
            ),
          ),
),
          const SizedBox(height: 20,),

          Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account ?"),
            const SizedBox(width: 5,),
            GestureDetector(
              onTap:(){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginPage()),(route)=>false);
              },
              child: const Text("Login",style: TextStyle(color: Colors.blue,
                fontWeight: FontWeight.bold),),
            )
          ],)

                ],
                ),
        )
      ),
    );
  }











  void _signUp() async{
    String username =_usernameController.text;
    String email= _emailController.text;
    String password= _passwordController.text;


    User? user= await _auth.signUpWithEmailAndPassword(email,password);

    if(user!=null){
      print("User is Successfully created");
      /*
      Navigator.pushNamed(context, "/HomePage");
      */

      
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const HomePage()),(route)=>false);
            


    }else
    {
      print("Some Error Occurred");
    }

  }
}

class FirebaseAuthService {
  final FirebaseAuth _auth=FirebaseAuth.instance;
   Future<User?> signUpWithEmailAndPassword(String email, String password)async{
    try{
      UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;

    }
    catch(e){
      print("some error occured");
    }
    return null;
   }

Future<User?> signInWithEmailAndPassword(String email, String password)async{
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email:email,password: password);
      return credential.user;
    }
    catch(e){
      print("Some error occurred");

    }
    return null;


}
}

