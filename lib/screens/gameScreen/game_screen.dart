import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:munchkins/components/box_game.dart';
import 'package:munchkins/const.dart';
import 'package:munchkins/screens/newPlayerScreen/new_player_screen.dart';

class GameScreen extends StatefulWidget {
  static const String id = 'game_screen';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('players');

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
                  onPressed: () {
                    Navigator.pushNamed(context, NewPlayerScreen.id);
                  },
                  backgroundColor: textColorLight,
                  child: Icon(Icons.add),
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          color: backgroundColor,
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<DatabaseEvent>(
                  stream: ref.onValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erro: ${snapshot.error}'));
                    } else {
                      final data = snapshot.data!.snapshot.value;
                      Map<dynamic, dynamic> playerList = data as Map;

                      return ListView.builder(
                        itemCount: playerList.length,
                        itemBuilder: (context, index) {
                          final playerId = playerList.keys.elementAt(index);
                          final player = playerList[playerId];

                          return Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: BoxGame(
                              id: playerId,
                              name: player['name'],
                              gender: player['gender'],
                              colors: player['colors'],
                              level: player['level'],
                              strength: player['strength'],
                              power: player['power'],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
