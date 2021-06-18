import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.white,
      height: MediaQuery.of(context).size.height/9,
      width: MediaQuery.of(context).size.width,
     child:Padding(
       padding:EdgeInsets.fromLTRB(5,20,0,5),
       child:
      Row(
       children: [
         Text('Cataloge',
         style:TextStyle(color: Colors.lightBlue,
         fontSize: 25 ),),
      Spacer(),
         Padding(padding:EdgeInsets.fromLTRB(0,10,0,0),
           child:  Icon(
      Icons.account_circle_outlined,
      color: Colors.blue,
      size: 44.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),),

      
       ],
     ),    
     ),
    );
  }
}