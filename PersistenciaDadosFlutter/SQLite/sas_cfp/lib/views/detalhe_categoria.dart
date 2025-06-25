import 'package:flutter/material.dart';
import 'package:sas_cfp/controllers/categorias_controller.dart';
import 'package:sas_cfp/controllers/transacao_controller.dart';
import 'package:sas_cfp/models/categorias_model.dart';

class DetalheCategoriaScreen extends StatefulWidget {
  final int categoriaId;

  const DetalheCategoriaScreen({
    super.key,
    required this.categoriaId,
  });

  @override
  State<StatefulWidget> createState() => _DetalheCategoriaScreenState();
}

class _DetalheCategoriaScreenState extends State<DetalheCategoriaScreen> {
  final _categoriasControl = CategoriasController();

  Categorias? _categoria;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  void _carregarDados() async {
    setState(() {
      _isLoading = true;
    });

    try {
      _categoria = await _categoriasControl.readCategoriaById(widget.categoriaId);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao carregar categoria: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalhes da Categoria")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _categoria == null
              ? const Center(child: Text("Categoria não encontrada"))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nome: ${_categoria!.nome}", style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Text("Transações: ${_categoria!.transacoes.length}"),
                    ],
                  ),
                ),
    );
  }
}
