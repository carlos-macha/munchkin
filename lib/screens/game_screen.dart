import 'package:flutter/material.dart';
import 'package:munchkins/components/color_select.dart';
import 'package:munchkins/components/gender_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:munchkins/components/gmaer_information.dart';
import 'package:munchkins/components/icon_content.dart';
import 'package:munchkins/services/database_service.dart';

enum Gender {
  male,
  female,
}

enum color {
  blue,
  red,
  green,
  yellow,
  orange,
  purple,
  teal,
}

class GameScreen extends StatefulWidget {
  static const String id = 'game_screen';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Gender? selectedGender;
  color SelectedColor = color.blue;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          flexibleSpace: Center(
            child: Text(
              'Munchkins',
              style: TextStyle(
                color: Color(0xFFE0E0E0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {
                  _showModal(context); // Chama a função para exibir a modal
                },
                icon: Icon(
                  Icons.add,
                  color: Color(0xFFE0E0E0),
                  size: 40,
                ),
              ),
            ),
          ],
          backgroundColor: Color(0xFF121212),
        ),
        body: Container(
          child: GmaerInformation(),
        ),
        backgroundColor: Color(0xFF1E1E1E),
      ),
    );
  }

  // Função para mostrar a modal
  void _showModal(BuildContext context) {
    const Widget _gap = SizedBox(
      height: 20,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Modal agora é um StatefulWidget
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'Novo Jogador',
                  style: TextStyle(color: Color(0xFFE0E0E0)),
                ),
              ),
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged:  (texto) {
                              setState(() {
                                name = texto;
                              },);
                            },
                            style: TextStyle(
                              color: Color(0xFFE0E0E0),
                            ),
                            cursorColor: Color(0xFFE0E0E0),
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(113, 224, 224, 224),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 2), // Cor da linha quando em foco
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    _gap,
                    Row(
                      children: [
                        Expanded(
                          child: GenderButton(
                            colour: selectedGender == Gender.male
                                ? Color(0xFF121212)
                                : Color(0xFF1E1E1E),
                            cardChild: IconContent(
                                icon: FontAwesomeIcons.mars, label: 'MACHO'),
                            onPress: () {
                              setState(() {
                                selectedGender =
                                    Gender.male; // Atualiza o estado
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: GenderButton(
                            colour: selectedGender == Gender.female
                                ? Color(0xFF121212)
                                : Color(0xFF1E1E1E),
                            cardChild: IconContent(
                                icon: FontAwesomeIcons.venus, label: 'FEMEA'),
                            onPress: () {
                              setState(() {
                                selectedGender =
                                    Gender.female; // Atualiza o estado
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    _gap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ColorSelect(
                          colour: Colors.blue,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.blue; // Atualiza o estado
                            });
                          },
                          EnumColor: color.blue,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.red,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.red; // Atualiza o estado
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
                              SelectedColor = color.green; // Atualiza o estado
                            });
                          },
                          EnumColor: color.green,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.yellow,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.yellow; // Atualiza o estado
                            });
                          },
                          EnumColor: color.yellow,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.orange,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.orange; // Atualiza o estado
                            });
                          },
                          EnumColor: color.orange,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.purple,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.purple; // Atualiza o estado
                            });
                          },
                          EnumColor: color.purple,
                          SelectedColor: SelectedColor,
                        ),
                        ColorSelect(
                          colour: Colors.teal,
                          onPress: () {
                            setState(() {
                              SelectedColor = color.teal; // Atualiza o estado
                            });
                          },
                          EnumColor: color.teal,
                          SelectedColor: SelectedColor,
                        ),
                      ],
                    ),
                    _gap,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () async {
                                   DatabaseServicePost service = DatabaseServicePost();
                                  await service.salvarUsuario(name, selectedGender.toString(), SelectedColor.toString());
                                  await service.getUsuario();
                                  print(service.jogadores1);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Color(0xFF121212),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: Color(0xFF1E1E1E),
            );
          },
        );
      },
    );
  }
}
