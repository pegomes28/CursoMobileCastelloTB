import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_firebase/firebase_options.dart';
import 'package:todo_list_firebase/views/auth_widget.dart';

void main() async {
  //Conectar com o Firebase
  // Garantir o carregamento primeiro das bindings
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializar o Firebase
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, //garante a conexãi com Android
  );
  runApp(MaterialApp(title: "Lista de Tarefas Firebase",
  home: AuthWidget(), //Widget que decide qual tela mostrar

   )
  );
}


