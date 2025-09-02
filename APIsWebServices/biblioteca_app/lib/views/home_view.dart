import 'package:biblioteca_app/views/emprestimos/emprestimo_list_view.dart';
import 'package:biblioteca_app/views/livros/livros_list_view.dart';
import 'package:biblioteca_app/views/usuarios/usuarios_list_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _index = 0;

  final List<Widget> _paginas = [
    const LivrosListView(),
    const EmprestimoListView(),
    const UsuarioListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gerenciador de Biblioteca")),
      body: _paginas[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() {
          _index = i;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Livros"),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Emprestimos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: "Usuários",
          ),
        ],
      ),
    );
  }
}
