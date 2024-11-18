import 'package:flutter/material.dart';
import 'package:munchkins/screens/game_screen.dart';

class ColorSelect extends StatefulWidget {
  const ColorSelect({super.key, required this.colour, required this.onPress, required this.EnumColor, required this.SelectedColor,});

  final Color colour;
  final VoidCallback onPress;
  final color EnumColor;
  final color? SelectedColor;

  @override
  State<ColorSelect> createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: EdgeInsets.all(2),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: widget.colour,
          border: Border.all(
            color: widget.EnumColor == widget.SelectedColor
                ? Color(0xFFE0E0E0) // Cor da borda quando selecionado
                : Colors.transparent, // Sem borda quando não selecionado
            width: 4,
          )
        ),
       
      ),
    );
  }
}
