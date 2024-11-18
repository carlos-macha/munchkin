import 'package:firebase_database/firebase_database.dart';


class DatabaseServicePost {
  late String user;
  late String gender;
  late String color;
  Map <String, dynamic> jogadores1 = {};
  final DatabaseReference jogadores = FirebaseDatabase.instance.ref();

  Future<void> salvarUsuario(String name, String gender, String color) async {
    try {
      final jogadorRef = jogadores.child('jodadores').push();
      //final id = jogadorRef.key; 
      await jogadorRef.set({
        'nome': name,
        'genero': gender,
        'cor': color,
      });
      print('Usuário salvo com sucesso!');
    } catch (error) {
      print('Erro ao salvar dados no Realtime Database: $error');
    }
  }

  // Função para buscar dados de um usuário
  Future<void> getUsuario() async {
    try {
    // Obtendo todos os dados da chave 'usuarios'
    DataSnapshot snapshot = await jogadores.child('jodadores').get();

    if (snapshot.exists) {
      // Recuperando os dados e tratando como um mapa de usuários
      Map<dynamic, dynamic> usuarios = snapshot.value as Map<dynamic, dynamic>;
    
    
    
      // Iterando sobre o mapa de usuários
      usuarios.forEach((id, usuario) {
        jogadores1[id] = {
          'nome': usuario['nome'],
          'genero': usuario['genero'],
          'cor': usuario['cor'],
        };
      });
    } else {
      print('Nenhum dado encontrado.');
    }
  } catch (error) {
    print('Erro ao obter dados: $error');
  }
  }
  
}

