// widget de autenticação de usuário que vai direcionar o usuário logado para as telas

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_firebase/views/login_view.dart';
import 'package:todo_list_firebase/views/tarefas_view.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Direcionamento de telas dinâmico,
    // Direciona o Usuário de acordo com as informações salvas no cache(snapshot)
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // se Snapshot tem dados, significa que o usuário está logado
        if (snapshot.hasData) {
          return TarefasView();
        }
        // caso Contrario
        return LoginView();
      }
    );
  }
}
