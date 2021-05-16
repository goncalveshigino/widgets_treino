import 'package:flutter/material.dart'; 

class BlueButton extends StatelessWidget {

  BlueButton(this.text, {this.onPressed, this.color = Colors.blue});

 String text;
 Function onPressed;
 Color color;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
       child: Text(
         text, 
         style: TextStyle(color: Colors.white)
         ),
       onPressed: onPressed,
     );
  }
   _voltar(context) =>Navigator.pop(context, 'Tela 2');
}