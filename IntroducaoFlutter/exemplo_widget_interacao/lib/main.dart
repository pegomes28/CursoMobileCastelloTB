import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: TelaCadastroApp()));
}

// Criar uma tela de cadastro (Formulário) - 
class TelaCadastroApp extends StatefulWidget{
  @override
  _TelaCadastroAppState createState() => _TelaCadastroAppState();
}

class _TelaCadastroAppState extends State<TelaCadastroApp>{
  // Atributos
 final _formKey = GlobalKey<FormState>(); // Chave de seleção dos componentes do Fomulário
  String _nome = "";  // Utilização do "_" antes da ceclaração da variável (private)
  String _email = "";
  String _senha = "";
  String _genero = "";
  String _dataNascimento = "";
  double _experiencia = 0;
  bool _aceite = false;  // Declaração da Boolean (bool)

  // Métodos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Usuário - Exemplo Widget Interação")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,  // Validação de Formulário
          child: Column(
            children: [
              // Campo Nome:
              TextFormField(
                decoration: InputDecoration(labelText: "Insira um Nome"),
                validator: (value) => value!.isEmpty ? "Digite um Nome!" : null, // operador ternário
                onSaved: (value)=> _nome = value!, 
              ),
              //Campo Email:
              TextFormField(
                decoration: InputDecoration(labelText: "Insira seu Email"),
                validator: (value) => value!.contains("@") ? null : "Digite um Email válido",
                onSaved: (value) => _email = value!,
                ),
              // Campo Senha:
              TextFormField(
                decoration: InputDecoration(labelText: "Insira uma Senha"),
                obscureText: true,
                validator: (value) => value!.trim().length>=6 ? null : "Número mínimo de caracteres: 6",
                onSaved: (value)=> _senha = value!.trim(),
              ),
              // Campo Gênero
              Text("Gênero"),
              DropdownButtonFormField(
                items: ["Feminino", "Masculino", "Outro"].map((String genero)=>DropdownMenuItem(
                  value: genero,
                  child:Text(genero))).toList(), 
                onChanged: (value){},
                validator: (value) => value==null ? "Selecione um Gênero" : null,
                onSaved: (value) => _genero = value!
              ),
               // Campo DataNascimento:
              TextFormField(
                decoration: InputDecoration(labelText: "Insira sua Data de Nascimento"),
                validator: (value) => value!.trim().isEmpty ? "Digite sua Data de Nascimento!" : null, // operador ternário
                onSaved: (value)=> _dataNascimento = value!.trim(), 
                ),
              // Slider de Seleção (experiência)
              Text("Anos de Experiênica com Programação: "),
              Slider(
                value: _experiencia,
                min: 0,
                max: 20,
                divisions: 20,
                label: _experiencia.round().toString(), 
                onChanged: (value)=>setState(() {
                  _experiencia = value;
                })),
              // Aceite dos Termos de Uso
              CheckboxListTile(
                value: _aceite,
                title: Text("Aceite os Termos de Uso do Aplicativo"), 
                onChanged: (value)=>setState(() {
                  _aceite = value!;
                })),
                // botão de envio do formulário
                ElevatedButton(
                  onPressed: _enviarFormulario, 
                  child: Text("Enviar"))
            ],
          )),
          ),
    );
  }
  void _enviarFormulario(){
    
  }
}