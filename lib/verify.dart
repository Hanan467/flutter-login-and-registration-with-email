import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:idkapp/BackgroundImage.dart';
import 'package:idkapp/Home.dart';

class verify extends StatefulWidget {
  const verify({super.key});

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  bool isverified = false;

    @override
void initState(){
  super.initState();
  //we should create a user first
  isverified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isverified){
    sendVerification();
  }
}
//method to send z verification
 Future sendVerification()async{
  final user = FirebaseAuth.instance.currentUser!;
  await user.sendEmailVerification();
 }
  @override
  Widget build(BuildContext context) => isverified
  ? const Home()
  :Stack( 
   children:[
    BackgroundImage(),
    Scaffold(
      backgroundColor: Colors.transparent,
    body: Center(
      child:Column(
      children:[ 
        const SizedBox(height: 150,),
        const Icon(Icons.email,
        size: 150,),
        const SizedBox(height: 25,),
        const Text(" Let's Verify your email address !",
        style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold,color:Colors.blueGrey),
        ),
        const SizedBox(height: 40,),
        const Text("We have sent a verification email to you",
        style: TextStyle(
          fontSize: 17,)),
        const SizedBox(height: 20,),
        const Text('Check your email and click on the verification',
        style: TextStyle(
          fontSize: 17,)),
          const SizedBox(height: 10,),
        const Text('link to continue',
        style: TextStyle(
          fontSize: 17,)),
          const SizedBox(height: 55,),
        TextButton(onPressed: sendVerification, 
        child: const Text('Resend email',
        style: TextStyle(fontSize: 17),))      ]),
 )
  ),
 ], );
  
}