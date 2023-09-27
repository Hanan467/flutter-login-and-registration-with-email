import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idkapp/Login.dart';
import 'package:idkapp/Home.dart';
import 'package:idkapp/verify.dart';

class auth extends StatelessWidget {
  const auth({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot)
        {
          //user is logged in
          if(snapshot.hasData){
            return  Home();
          }
          //user is not logged in 
          else{
            return Login();
          }

        }
        ),
    );
  }
}