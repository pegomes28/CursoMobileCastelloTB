import 'package:flutter/material.dart';
import 'package:sas_cfp/controllers/categorias_controller.dart';
import 'package:sas_cfp/controllers/transacao_controller.dart';
import 'package:sas_cfp/models/categorias_model.dart';
import 'package:sas_cfp/views/detalhe_categoria.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Atributos
  final CategoriasController _categoriasController = CategoriasController();
  List<Categorias> _categorias = [];
  bool _isLoading = true; //Enquanto carrega info do BD

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
      _categorias = await _categoriasController.readCategorias();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Exception $e")));
    } finally {
      //Execu~ção obrigatória
      setState(() {
        _isLoading = false;
      });
    }
  }

  //Buildar a tela
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("FinanCuca")),
      body:
          _isLoading //operador ternário
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: _categorias.length,
                itemBuilder: (context, index) {
                  final Categorias = _categorias[index];
                  return ListTile(
                    title: Text("${Categorias.tipo} - ${Categorias.nome}"),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DetalheCategoriaScreen())),
                  );
                },
              ),
            ),
    );
  }
}
