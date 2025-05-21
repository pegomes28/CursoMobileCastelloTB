import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Método principal para rodar a aplicação
  runApp(
    MaterialApp(
      // Base de todos os Widgets (Elementos visuais do Aplicativo)
      home: TelaPerfil(), // Tela Inicial
      //routes:{

      //} , // Rotas de Navegação
      //theme: , // Tema do Aplicativo
      //darkTheme: , // Tema Alternativo
      debugShowCheckedModeBanner: false, // Remove o banner vermelho de debug
    ),
  );
}

class TelaPerfil extends StatefulWidget {
  //Tela dinâmica
  // Tela dinâmica
  @override
  State<TelaPerfil> createState() => _TelaPerfilState(); //Chama a mudança
}

class _TelaPerfilState extends State<TelaPerfil> {
  // Realiza a construção da tela
  //  atributos
  TextEditingController _nomeController =
      TextEditingController(); // Receber os dados do input
  TextEditingController _idadeController = TextEditingController();

  String? _nome; // Permite variáveis nulas
  String? _idade; // Permite variáveis nulas,
  String? _corSelecionada;

  String? _cor;

  Map<String, Color> coresDisponiveis = {
    "Vermelho": const Color.fromARGB(255, 243, 33, 33),
    "Laranja": const Color.fromARGB(255, 233, 128, 30),
    "Amarelo": const Color.fromARGB(255, 241, 202, 28),
    "Verde": const Color.fromARGB(255, 92, 255, 77),
    "Azul": Color.fromARGB(255, 77, 154, 255),
    "Roxo": const Color.fromARGB(255, 152, 36, 219),
    "Violeta": const Color.fromARGB(255, 77, 13, 197),
    "Rosa": const Color.fromARGB(255, 206, 40, 156),
    "Branco": const Color.fromARGB(255, 255, 255, 255),
  };

  // Criar a cor de fundo
  Color _corFundo = Colors.white;

  //  métodos
  @override
  void initState() {
    // Método para carregar informações antes de buildar a Tela
    // TODO: implement initState
    super.initState();
    _carregarPreferencias();
  }

  _carregarPreferencias() async {
    // Métodos assincrono (sem ordem de execução)
    // conectar com SharedPreferences
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      // Mudança de estado
      _nome = _prefs.getString("nome");
      _idade = _prefs.getString("idade");
      _cor = _prefs.getString("cor");
      if (_cor != null) {
        _corFundo = coresDisponiveis[_cor!]!; // !permite nulo
        _corSelecionada = _cor;
      }
    });
  }

  _salvarPreferencias() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _nome = _nomeController.text.trim();
    _idade = _nomeController.text.trim();
    _corFundo = coresDisponiveis[_cor!]!;

    await _prefs.setString("nome", _nome ?? ""); // Armazena o nome
    await _prefs.setString("idade", _idade ?? ""); // Armazena a idade
    await _prefs.setString(
      "cor",
      _cor ?? "Branco",
    ); // Armazena a cor, caso nulo armazena branco
    setState(() {});
  }

  // build
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: _corFundo,
      appBar: AppBar(
        title: Text("Meu Perfil Persistente"),
        backgroundColor: const Color.fromARGB(255, 184, 165, 236),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: _idadeController,
              decoration: InputDecoration(labelText: "Idade"),
              keyboardType: TextInputType.numberWithOptions(),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              value: _cor,
              decoration: InputDecoration(labelText: "Cor Favorita"),
              items:
                  coresDisponiveis.keys.map((cor) {
                    return DropdownMenuItem(value: cor, child: Text(cor));
                  }).toList(),
              onChanged: (valor) {
                setState(() {
                  _cor = valor;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _salvarPreferencias,
              child: Text("Salvar Dados"),
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            Text("Dados Salvos:"),
            if (_nome != null) Text("Nome: $_nome"),
            if (_idade != null) Text("Idade: $_idade"),
            if (_cor != null) Text("Cor Favorita: $_cor"),
          ],
        ),
      ),
    );
  }
}
