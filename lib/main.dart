import 'package:flutter/material.dart';
//import 'package:idkapp/Login.dart';cmd
import 'package:idkapp/auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
  runApp (const MaterialApp (
    home: auth(),
    
  ));
}

