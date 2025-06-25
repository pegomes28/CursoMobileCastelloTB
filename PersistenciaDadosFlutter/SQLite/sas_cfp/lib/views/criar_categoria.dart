import 'package:flutter/material.dart';
import 'package:sas_cfp/controllers/categorias_controller.dart';
import 'package:sas_cfp/models/categorias_model.dart';
import 'package:sas_cfp/views/home_screen.dart';

class CriarCategoriaScreen extends StatefulWidget {
  const CriarCategoriaScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CriarCategoriaScreenState();
  }
}

class _CriarCategoriaScreenState extends State<CriarCategoriaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _categoriasController = CategoriasController();

  late String _nome;
  late String _tipo;

  _salvarCategoria() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newCategoria = Categorias(nome: _nome, tipo: _tipo);
      await _categoriasController.createCategorias(newCategoria);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Categoria")),
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(key: _formKey,
      child: ListView(children: [
        TextFormField(decoration: InputDecoration(labelText: "Tipo da Categoria:"),
        validator: (value) => value!.isEmpty ? "Campo não preenchido" : null,
        onSaved: (newValue) => _tipo = newValue!,
        ),
        TextFormField(decoration: InputDecoration(labelText: "Nome da Categoria:"),
        validator: (value) => value!.isEmpty ? "Campo não preenchido" : null,
        onSaved: (newValue) => _nome = newValue!,
        ),
        ElevatedButton(onPressed: _salvarCategoria, child: Text("Cadastrar"))
        
      ],),),),
    );
  }
}
