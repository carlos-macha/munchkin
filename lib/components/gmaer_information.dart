import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GmaerInformation extends StatelessWidget {
  GmaerInformation({this.name, this.gender, this.force, this.lavel});
  final name;
  final gender;
  final lavel;
  final force;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text('carlos', style: TextStyle(color: Colors.black, fontSize: 20),),
                ],
              ),
              Row(
                children: [
                  Icon(FontAwesomeIcons.mars, size: 30,),
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(children: [GestureDetector(child: Icon(Icons.add, color: Colors.black,),)],),
              Row(children: [Text('1', style: TextStyle(color: Colors.black, fontSize: 30),)],),
              Row(children: [GestureDetector(child: Icon(Icons.remove, color: Colors.black,),)],)
            ],
          ),
          Column(
            children: [
              Row(children: [GestureDetector(child: Icon(Icons.add, color: Colors.black,),)],),
              Row(children: [Text('1', style: TextStyle(color: Colors.black, fontSize: 30),)],),
              Row(children: [GestureDetector(child: Icon(Icons.remove, color: Colors.black,),)],)
            ],
          ),
          Column(children: [Row(children: [Text('1', style: TextStyle(color: Colors.black, fontSize: 30),)],)],)
        ],
      ),
        ],
      ));
  }
}