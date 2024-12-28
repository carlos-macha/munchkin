import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:munchkins/const.dart';

// ignore: must_be_immutable
class BoxGame extends StatefulWidget {
  String id = '';
  String name = 'Hero';
  bool gender = true;
  String colors = 'color.blue';
  int level = 0;
  int strength = 0;
  int power = 0;

  BoxGame(
      {super.key,
      required this.id,
      required this.name,
      required this.gender,
      required this.colors,
      required this.level,
      required this.strength,
      required this.power});

  @override
  State<BoxGame> createState() => _BoxGameState();
}

class _BoxGameState extends State<BoxGame> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('players');

  Future<void> upDatePower(bool counter) async {
    counter ? widget.power++ : widget.power--;
    setState(() {
      widget.strength = widget.level + widget.power;
    });

    try {
      await ref
          .child(widget.id)
          .update({'power': widget.power, 'strength': widget.strength});
    } catch (e) {
      print(e);
    }
  }

  Future<void> upDateLevel(bool counter) async {
    counter ? widget.level++ : widget.level--;
    setState(() {
      widget.strength = widget.level + widget.power;
    });

    try {
      await ref
          .child(widget.id)
          .update({'level': widget.level, 'strength': widget.strength});
    } catch (e) {
      print(e);
    }
  }

  Future<void> upDateGendder() async {
    setState(() {
      widget.gender = widget.gender ? false : true;
    });

    try {
      await ref.child(widget.id).update({'gender': widget.gender});
    } catch (e) {
      print(e);
    }
  }

  Future<void> excluir() async {
    try {
      await ref.child(widget.id).remove();
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

    void _showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Você deseja excluir ${widget.name}', style: styleText,),
          backgroundColor: backgroundColor,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {excluir();},
                  child: Text('sim', style: TextStyle(color: Colors.black),),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {Navigator.pop(context);},
                  child: Text('não', style: TextStyle(color: Colors.black),),
                ),
              ],
            )
          ],
        );
      }
    );
  }

  Color colorSelect() {
    Color color = Colors.blue;
    switch(widget.colors) {
      case 'color.blue':
      color = Colors.blue;
        break;
      case 'color.red':
      color = Colors.red;
        break;
      case 'color.green':
      color = Colors.green;
        break;
      case 'color.yellow':
      color = Colors.yellow;
        break;
      case 'color.orange':
      color = Colors.orange;
        break;
      case 'color.purple':
      color = Colors.purple;
        break;
      case 'color.teal':
      color = Colors.teal;
        break;
    }
    return color; 
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorSelect(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(widget.name,
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            upDateGendder();
                          },
                          child: Icon(
                            widget.gender
                                ? FontAwesomeIcons.mars
                                : FontAwesomeIcons.venus,
                            size: 35,
                          ),
                        ),
                      ),
                      Text(widget.gender ? 'M' : 'F',
                          style: TextStyle(color: Colors.black, fontSize: 14))
                    ],
                  ),
                  Icon(
                    Icons.arrow_upward,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          upDateLevel(true);
                        },
                        child: Icon(Icons.add),
                      ),
                      Text(widget.level.toString(), style: styleTextBoxGame),
                      GestureDetector(
                        onTap: () {
                          upDateLevel(false);
                        },
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                  Icon(
                    FontAwesomeIcons.bolt,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          upDatePower(true);
                        },
                        child: Icon(Icons.add),
                      ),
                      Text(
                        widget.power.toString(),
                        style: styleTextBoxGame,
                      ),
                      GestureDetector(
                        onTap: () {
                          upDatePower(false);
                        },
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                  Text(widget.strength.toString(), style: styleTextBoxGame),
                ],
              ),
            )),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {_showModal(context);},
            color: Colors.black,
            iconSize: 20,
          ),
        ),
      ],
    );
  }
}
