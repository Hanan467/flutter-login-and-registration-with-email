import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idkapp/BackgroundImage.dart';
import 'package:idkapp/Registration.dart';
class Login extends StatefulWidget{

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //text editing controllers 
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Sign in method
void signIn() async {
  try{
await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailController.text, 
  password: passwordController.text,
  );
  }on FirebaseAuthException catch(e){
    //for wrong email
    if(e.code == 'user-not-found'){
      wrongEmail();
    }
    else{
      wrongPassword();
    }
  }
}

//Incorrect email message
void wrongEmail(){
 showDialog(
  context: context,
  builder: (context){
    return const AlertDialog(
      title:Text('Incorrect Email'),
    );
  }
  );
}

//Incorrect password message
void wrongPassword(){
showDialog(
  context: context,
  builder: (context){
    return const AlertDialog(
      title:Text('Incorrect password'),
    );
  }
  );
}
//switch to registeration page
switchPages(){
Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Registration()),
            );
}
  @override
  Widget build(BuildContext context)
  {
    return  Stack(
          children: [
          BackgroundImage(),
            Scaffold(
              resizeToAvoidBottomInset: false,
           backgroundColor: Colors.transparent, 
          body: SingleChildScrollView(
          child:SafeArea(
          child:Column(
            children:[
                  Center(
                  child: Column(
                    children: [
                      //
                       const SizedBox(height: 50,),
                       const Icon(
                        Icons.lock,
                        size: 120,
                            ),
          const SizedBox(height: 30,),
             const Text('Welcome back!',
           style:TextStyle(fontSize: 20,
           fontWeight:FontWeight.bold,
           color: Colors.blueGrey),
            ),
            
            const SizedBox(height: 45,),

           //for the email
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child:TextField(
              decoration:const InputDecoration(
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
             hintText: AutofillHints.email ),
             controller: emailController,
            ),
            ),
            
             const SizedBox(height: 45,),

            //for the password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child:TextField(
              decoration:const InputDecoration(
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
             hintText: AutofillHints.password,
             ),
            obscureText: true,
            controller: passwordController,),
            ),
        
            const SizedBox(height: 20,),
          //forgot password
          const Text('Forgot password?',
    style: TextStyle(color: Colors.blue),
    textAlign:TextAlign.right,),
const SizedBox(height: 30,),
            InkWell(
                onTap:signIn,
              child:Container(
                decoration:const BoxDecoration(color: Colors.blueAccent,),
                height: 40,
                width: 80,
                child: const Center(
                child:  Text('Sign in'),
                 ), ),),
           const SizedBox(height: 30,),
                      TextButton(
                onPressed:switchPages,
                child:  const Text('Create new account',
                style: TextStyle(color: Colors.blue),),
                 ), 
                 ],
                ),
         
                 ),
            ],
          ),
          ),
     ), ),],
      );
     
  }
}
