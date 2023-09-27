import 'package:flutter/material.dart';
class BackgroundImage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}
