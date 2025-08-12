import 'dart:convert'; //pacote do dart (já vem instalado no projeto) - não precisa instalar no pubspec
import 'package:flutter/material.dart';
import 'package:json_shared_preferences/tela_inicial.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: ConfigPage()));
}

class ConfigPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConfigPageState();
  }
}

class _ConfigPageState extends State<ConfigPage> {
  //atributos
  bool temaEscuro = false;
  String nomeUsuario = ""; //texto vazio

  // método que roda antes de carregar a página
  @override
  void initState() {
    super.initState();
    carregarPreferencias();
  }

  //método para carregar as informações do sharedPreferences
  void carregarPreferencias() async {
    final prefs =
        await SharedPreferences.getInstance(); // conexão com o sharedPreferences
    String? jsonString = prefs.getString(
      "config",
    ); // recebendo os valores referentes a chave "config" do sP (sharedPreferences)
    if (jsonString != null) {
      Map<String, dynamic> config = json.decode(jsonString);
      setState(() {
        //Método para mudança de estado
        temaEscuro = config["temaEscuro"] ?? false; // ?? operador para elemento null => atribui um valor caso o elemento seja nulo
        nomeUsuario = config["nome"] ?? "";
      });
    }
  }

  // Construção da Tela
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App de Configuração",
      theme: temaEscuro ? ThemeData.dark() : ThemeData.light(), // Operador Ternário (if / else)
      home: TelaInicial(temaEscuro: temaEscuro, nomeUsuario: nomeUsuario,),

    );
  }
  }

