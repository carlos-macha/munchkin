import 'package:flutter/material.dart';
import 'package:munchkins/const.dart';
import 'package:munchkins/screens/newPlayerScreen/new_player_screen.dart';

class GameScreen extends StatefulWidget {
  static const String id = 'game_screen';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColorDark,
          centerTitle: true,
          title: Text(
            'Munchkin',
            style: TextStyle(color: textColorLight),
          ),
          actions: [
            Padding(
              child: SizedBox(
                child: FloatingActionButton(
                  onPressed:() {Navigator.pushNamed(context, NewPlayerScreen.id);},
                  backgroundColor: textColorLight,
                  child: Icon(Icons.add),
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
        body: Container(
          color: backgroundColor,
        ),
      ),
    );
  }
}
