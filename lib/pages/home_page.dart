import 'package:flutter/material.dart';
import 'package:widgets/pages/hello_page1.dart';
import 'package:widgets/utils/push.dart';
import 'package:widgets/widgets/blue_button.dart';
import 'package:widgets/widgets/drawer.dart';

import 'hello_list_view.dart';
import 'hello_page2.dart';
import 'hello_page3.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Hello Flutter'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab( text: "TAB1"),
                Tab( text: "TAB2"),
                Tab( text: "TAB3"),
              ]
            ),
        
          ),
          body: TabBarView(
            children: [
              _body(context),
              Container(
                color: Colors.red,
              ), 
              Container(
                color: Colors.yellow,
              )
            ],
           ),
          floatingActionButton: _floatingActionButton(),
          drawer: MeuDrawer(),
      ),
    );
  }

 _floatingActionButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            onPressed: () => _onClickFab(),
            child: Icon(Icons.add),
        ),
        SizedBox(height: 8,),
         FloatingActionButton(
            onPressed: () => _onClickFab(),
            child: Icon(Icons.favorite),
        ),
      ],
    );
  }
  _onClickFab(){
     print('Add');
  }


  /*_body(context) {
     return Column(
        children: [
          Expanded(
            flex: 7,
            child: _pageView(),
          ), 
          Expanded(
            flex: 3,
            child: _pageView(),
          ),  
          
        ],
     );
  }*/

   _body(context) {
     return Container(
       padding: EdgeInsets.only(top: 16),
       color: Colors.white,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _text(), 
           _pageView() , 
            _buttons(context),
          ],
       ),
     );
  }



_pageView() {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12),
      height: 300,
      child: PageView(
        children: [
            _img('assets/images/dog1.png'), 
            _img('assets/images/dog2.png'),
            _img('assets/images/dog3.png'), 
            _img('assets/images/dog4.png'), 
            _img('assets/images/dog5.png'), 
        ],
      ),
    );
  }



_buttons(context) {
    return Column(
           children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    BlueButton("ListView", onPressed: () => _onClickNavigator(context, ListViewPage())), 
                    BlueButton( "Page 2", onPressed: () => _onClickNavigator(context, HelloPage2())), 
                    BlueButton( "Page 3", onPressed: () => _onClickNavigator(context, HelloPage3()))
                ],
              ), 
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  BlueButton("Snack", onPressed: () => _onClickSnack(context)), 
                  BlueButton("Dialog", onPressed:() => _onClickDialog(context)), 
                  BlueButton("Toast", onPressed: _onClickToast)
              ],
            )
           ], 
         );
  }


    Future<void> _onClickNavigator( BuildContext context, Widget page) async {
   
     String s = await push(context, page);

    print(" >> $s");
  }

  _onClickSnack(context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('SnackBar'), 
        duration: Duration(milliseconds: 2000),
        action: SnackBarAction(
          textColor: Colors.yellow,
           label: "OK", 
           onPressed:(){}
          ),
        backgroundColor: Colors.black
      ),
    );

  }

  _onClickDialog(context){
     showDialog(
       context: context, 
       barrierDismissible: false,
       builder: (context){
       
       return WillPopScope(
         onWillPop: () async => false,
         child: AlertDialog(
           title: Text('Flutter gsgsg'),
           actions: [

             FlatButton(
               child: Text('Cancelar'),
               onPressed: (){
                 Navigator.pop(context);
               },
             ), 

             FlatButton(
               child: Text('Ok'),
               onPressed: (){
                  Navigator.pop(context);
                  print("OK");
               },
             )
           ],
         ),
       );
     });
  }

  _onClickToast(){
    
  }



  _img(String img){
     return Container(
       margin: EdgeInsets.all(20),
       child: Image.asset(
          img, 
          fit: BoxFit.cover, 
          height: 300, 
       ),
     );
  }

  _text() {
     return Text(
        'Hello Flutter', 
        style: TextStyle(
          fontSize: 30, 
          color: Colors.blue, 
          fontWeight: FontWeight.bold, 
          fontStyle: FontStyle.italic
        ),
      );
  }
}