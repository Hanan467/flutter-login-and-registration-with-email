import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idkapp/BackgroundImage.dart';
import 'package:idkapp/Home.dart';
import 'package:idkapp/Login.dart';
import 'package:idkapp/verify.dart';
//import 'package:idkapp/main.dart';


class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var value=true;
  bool showRegistration = true;
  bool showLogin = false;

//creating variables for controller
final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmpassController = TextEditingController();
final nameController = TextEditingController();
//Sign up user
void signUp()async{
  
    ///checking both z pass r equal
    
    if(passwordController.text==confirmpassController.text){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text, 
    password: passwordController.text);
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const verify()),
            );   
             }
    else{
     passwordMismatch();
    }
 
}
//password don't match message
passwordMismatch(){
  showDialog(
  context: context,
  builder: (context){
    return const AlertDialog(
      title:Text('password Mismatch'),
    );
  }
  );
}
//Switch to login page 
 switchPages(){
Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
}
  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          BackgroundImage(),
           Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
          child:SafeArea(
              child:  Center(
                child: Column(
                  children:[
                  const SizedBox(height: 140,),
                const Text("Create Account",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey,fontSize: 30),
                ),
              
                 const SizedBox(height: 20,),
                  const Text('Get started by craeting new account',
                  style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 14),),
                   
                  const SizedBox(height: 30,),

             const Padding(
                padding: EdgeInsets.symmetric(horizontal:25.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  hintText: AutofillHints.name),
                ),
              ),
             const SizedBox(height: 30,),
              
               Padding(
                padding:const EdgeInsets.symmetric(horizontal:25.0),
                child: TextField(
                  decoration:const InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  hintText: AutofillHints.email,),
                  
               controller: emailController, ),
              ),
             const SizedBox(height:30),
               Padding(
                padding:  const EdgeInsets.symmetric(horizontal:25.0),
               child: TextField(
                  decoration: const InputDecoration(
                    enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
                  focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  hintText: AutofillHints.password,),obscureText: value,
                  controller: passwordController,),
                ),
       
              const SizedBox(height: 30,),
              
              Padding(
                padding:const EdgeInsets.symmetric(horizontal:25.0),
                child: TextField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  hintText: 'confirm password'),
                  obscureText: true,
                  controller: confirmpassController,
                ),
              ),
           
             const SizedBox(height: 30,),
              GestureDetector(
                onTap: signUp,
              child:Container(
                decoration:const BoxDecoration(color: Colors.blueAccent,),
                height: 40,
                width: 80,
                child: const Center(
                child:  Text('Sign up'),
                 ), ),),
                   const SizedBox(height:20),
                 TextButton(onPressed:switchPages,
                 child:const Text('Already have an account?Sign in',
                 style:TextStyle(color: Colors.blue,fontSize: 15) ,),
               ), ], ),
          ),
            )
          ) ,
     ), ],
    );
  }
}