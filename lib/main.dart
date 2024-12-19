import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:munchkins/firebase_options.dart';
import 'package:munchkins/screens/gameScreen/game_screen.dart';
import 'package:munchkins/screens/newPlayerScreen/new_player_screen.dart';

Future<void> main() async {
  // Garante que os widgets Flutter sejam inicializados antes de qualquer operação assíncrona
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Firebase com as configurações específicas para a plataforma
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Usa as opções geradas no firebase_options.dart
  );
  runApp(const Munchkins());
}

class Munchkins extends StatelessWidget {
  const Munchkins({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: GameScreen.id,
      routes: {
        GameScreen.id: (context) => GameScreen(),
        NewPlayerScreen.id: (context) => NewPlayerScreen(),
      },
    );
  }
}


