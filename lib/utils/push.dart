import 'package:flutter/material.dart'; 

    push(BuildContext context, Widget page){
      return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return page;
         }
        )
      );
    }