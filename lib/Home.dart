import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
//sign out method
void signOut(){
  FirebaseAuth.instance.signOut();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body:Center(
  heightFactor: 50,
  child:SafeArea(
    child: Column(
    children: [
    const Text('u r loogged in'),
    TextButton(onPressed: signOut, child: const Text('Signout'))
   ], ),
  ),
 ),
    ); 
  }
}