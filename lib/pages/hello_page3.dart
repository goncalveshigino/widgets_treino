import 'package:flutter/material.dart';
import 'package:widgets/widgets/blue_button.dart'; 

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('Page 3'),
       ),
       body: _body(context)
    );
  }

  _body(context) {
    return Center(
       child: BlueButton(
         "voltar",
         onPressed: () => _voltar(context),
       )
    );
  }

   _voltar(context) =>Navigator.pop(context, 'Tela 2');
}