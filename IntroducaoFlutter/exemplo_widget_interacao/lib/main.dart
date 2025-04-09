import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TelaCadastroApp()));
}

// Criar uma tela de cadastro (Formulário) -
class TelaCadastroApp extends StatefulWidget {
  @override
  _TelaCadastroAppState createState() => _TelaCadastroAppState();
}

class _TelaCadastroAppState extends State<TelaCadastroApp> {
  // Atributos
  final _formKey =
      GlobalKey<FormState>(); // Chave de seleção dos componentes do Fomulário
  String _nome =
      ""; // Utilização do "_" antes da ceclaração da variável (private)
  String _email = "";
  String _senha = "";
  String _genero = "";
  String _dataNascimento = "";
  double _experiencia = 0;
  bool _aceite = false; // Declaração da Boolean (bool)
  bool _senhaOculta = true;

  // Métodos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Usuário - Exemplo Widget Interação"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey, // Validação de Formulário
          child: Column(
            children: [
              // Campo Nome:
              TextFormField(
                decoration: InputDecoration(labelText: "Insira um Nome"),
                validator:
                    (value) =>
                        value!.isEmpty
                            ? "Digite um Nome!"
                            : null, // operador ternário
                onSaved: (value) => _nome = value!.trim(),
              ),
              SizedBox(height: 15),
              //Campo Email:
              TextFormField(
                decoration: InputDecoration(labelText: "Insira seu Email"),
                validator:
                    (value) =>
                        value!.contains("@") ? null : "Digite um Email válido",
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 15),
              // Campo Senha:
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Insira uma Senha",
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _senhaOculta = !_senhaOculta;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
                obscureText: _senhaOculta,
                validator:
                    (value) =>
                        value!.trim().length >= 6
                            ? null
                            : "Número mínimo de caracteres: 6",
                onSaved: (value) => _senha = value!.trim(),
              ),
              SizedBox(height: 15),
              // Campo Gênero
              Text("Gênero"),
              DropdownButtonFormField(
                items:
                    ["Feminino", "Masculino", "Outro"]
                        .map(
                          (String genero) => DropdownMenuItem(
                            value: genero,
                            child: Text(genero),
                          ),
                        )
                        .toList(),
                onChanged: (value) {},
                validator:
                    (value) => value == null ? "Selecione um Gênero" : null,
                onSaved: (value) => _genero = value!,
              ),
              SizedBox(height: 15),
              // Campo DataNascimento:
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Insira sua Data de Nascimento",
                ),
                validator:
                    (value) =>
                        value!.trim().isEmpty
                            ? "Digite sua Data de Nascimento!"
                            : null, // operador ternário
                onSaved: (value) => _dataNascimento = value!.trim(),
              ),
              SizedBox(height: 15),
              // Slider de Seleção (experiência)
              Text("Anos de Experiênica com Programação: "),
              Slider(
                value: _experiencia,
                min: 0,
                max: 20,
                divisions: 20,
                label: _experiencia.round().toString(),
                onChanged:
                    (value) => setState(() {
                      _experiencia = value;
                    }),
              ),
              SizedBox(height: 15),
              // Aceite dos Termos de Uso
              CheckboxListTile(
                value: _aceite,
                title: Text("Aceite os Termos de Uso do Aplicativo"),
                onChanged:
                    (value) => setState(() {
                      _aceite = value!;
                    }),
              ),
              SizedBox(height: 15),
              // botão de envio do formulário
              ElevatedButton(
                onPressed: _enviarFormulario,
                child: Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate() && _aceite) {
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Dados do Formulário"),
              content: Column(
                children: [Text("Nome: $_nome"), Text("Nome: $_email")],
              ),
            ),
      );
    }
  }
}
