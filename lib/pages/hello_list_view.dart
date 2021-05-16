import 'package:flutter/material.dart';
import 'package:widgets/models/cachorro.dart';
import 'package:widgets/utils/push.dart';

import 'dog_page.dart'; 

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('ListView'),
         actions: [
            IconButton( icon: Icon(Icons.list),onPressed: (){
              print('List');
              _gridView = false;
              setState(() { });
            }),
            IconButton( icon: Icon(Icons.grid_on),onPressed: (){
              print('Grid');
              _gridView = true;
              setState(() {});
            }),
          ],
       ),
       body: _body()
    );
  }

  _body() {

    List<Dog> dogs = [
      Dog("Jack Russel","assets/images/dog1.png"), 
      Dog("Labrador","assets/images/dog2.png"), 
      Dog("Pug","assets/images/dog3.png"), 
      Dog("Rottweiler","assets/images/dog4.png"), 
      Dog("Pastor","assets/images/dog5.png")
    ];
  
    

   // return ListView.builder(
   if(_gridView)
        return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index){
        return _itemView(dogs, index);
        },
       );
    else 
       return ListView.builder(
         itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (context, index){
        return _itemView(dogs, index);
        },
       );
  }

 _itemView(List<Dog> dogs, int index){
  Dog dog = dogs[index];

         return GestureDetector(
           onTap: (){
             push(context,DogPage(dog));
           },
           child: Stack(
             fit: StackFit.expand,
             children: [
                _img(dog.photo), 
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(17)
                    ),
                    child: Text(
                      dog.name, 
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                )
             ],
           ),
         ); 
 }

 
  _img(String img){
     return Container(
       child: Image.asset(
          img, 
          fit: BoxFit.cover, 
          height: 300, 
       ),
     );
  }
}