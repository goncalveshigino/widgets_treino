import 'package:flutter/material.dart';
import 'package:widgets/models/cachorro.dart'; 

class DogPage extends StatelessWidget {
 
 DogPage(this.dog);

 final  Dog dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(dog.name),
       ),
       body: Image.asset(dog.photo),
    );
  }
}