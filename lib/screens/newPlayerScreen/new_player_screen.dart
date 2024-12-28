import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:munchkins/components/color_select.dart';
import 'package:munchkins/components/containerBox.dart';
import 'package:munchkins/components/gender_button.dart';
import 'package:munchkins/components/icon_content.dart';
import 'package:munchkins/const.dart';
import 'package:munchkins/enums/color.dart';
import 'package:munchkins/interface/player.dart';

class NewPlayerScreen extends StatefulWidget {
  static const String id = 'new_player_screen';
  const NewPlayerScreen({super.key});

  @override
  State<NewPlayerScreen> createState() => _NewPlayerScreenState();
}

class _NewPlayerScreenState extends State<NewPlayerScreen> {
  Widget _gap = SizedBox(
    height: 20,
  );
  color SelectedColor = color.blue;
  bool selectedGender = true;
  DatabaseReference ref = FirebaseDatabase.instance.ref("players");
  String name = 'Hero';


  void save() {
    
    Player player = Player(
      name: name,
      gender: selectedGender,
      colors: SelectedColor.toString(),
      level: 0,
      strength: 0,
      power: 0
    );
    ref.push().set(player.toMap()).then((e) {Navigator.pop(context);});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: textColorLight),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: backgroundColorDark,
          centerTitle: true,
          title: Text(
            'Novo jogador',
            style: TextStyle(
              color: textColorLight,
            ),
          ),
        ),
        body: Container(
          color: backgroundColor,
          child: Column(
            children: [
              _gap,
              Containerbox(
                child: Column(
                  children: [
                    _gap,
                    Text(
                      'Digite o Nome',
                      style: styleText,
                    ),
                    _gap,
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            name = text;
                          });
                        },
                        style: TextStyle(color: textColorLight),
                        decoration: textFieldDecoration,
                      ),
                    ),
                    _gap,
                  ],
                ),
              ),
              _gap,
              Containerbox(
                child: Column(
                  children: [
                    _gap,
                    Text(
                      'Escolha o gênero',
                      style: styleText,
                    ),
                    _gap,
                    Row(
                      children: [
                        Expanded(
                          child: GenderButton(
                            colour: selectedGender == true
                                ? backgroundColor
                                : backgroundColorDark,
                            cardChild: IconContent(
                                icon: FontAwesomeIcons.mars, label: 'MACHO'),
                            onPress: () {
                              setState(
                                () {
                                  selectedGender = true;
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: GenderButton(
                            colour: selectedGender == false
                                ? backgroundColor
                                : backgroundColorDark,
                            cardChild: IconContent(
                                icon: FontAwesomeIcons.venus, label: 'FEMEA'),
                            onPress: () {
                              setState(() {
                                selectedGender = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _gap,
              Containerbox(
                child: Column(
                  children: [
                    _gap,
                    Text(
                      'Escolha a cor',
                      style: styleText,
                    ),
                    _gap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ColorSelect(
                          colour: Colors.blue,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.blue;
                            });
                          },
                          EnumColor: color.blue,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.red,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.red;
                            });
                            print(SelectedColor);
                          },
                          EnumColor: color.red,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.green,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.green;
                            });
                          },
                          EnumColor: color.green,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.yellow,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.yellow;
                            });
                          },
                          EnumColor: color.yellow,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.orange,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.orange;
                            });
                          },
                          EnumColor: color.orange,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.purple,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.purple;
                            });
                          },
                          EnumColor: color.purple,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.teal,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.teal;
                            });
                          },
                          EnumColor: color.teal,
                          SelectedColor: SelectedColor,
                        ),
                      ],
                    ),
                    _gap,
                  ],
                ),
              ),
              _gap,
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: backgroundColorDark,
                      backgroundColor: textColorLight,
                    ),
                    onPressed: save,
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              _gap
            ],
          ),
        ),
      ),
    );
  }
}
