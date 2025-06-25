import 'package:flutter/material.dart';
import 'package:sas_cfp/controllers/categorias_controller.dart';
import 'package:sas_cfp/models/categorias_model.dart';
import 'package:sas_cfp/views/detalhe_categoria.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoriasController _categoriasController = CategoriasController();
  List<Categoria> _categorias = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  _carregarDados() async {
    setState(() {
      _isLoading = true;
    });

    try {
      _categorias = (await _categoriasController.readCategorias()).cast<Categoria>();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FinanCuca")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: _categorias.length,
                itemBuilder: (context, index) {
                  final categoria = _categorias[index];
                  return ListTile(
                    title: Text("${categoria.tipo} - ${categoria.nome}"),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalheCategoriaScreen(
                          categoriaId: index, // ou categoria.id, se existir
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class Categoria {
  get tipo => null;
  
  get nome => null;
}
