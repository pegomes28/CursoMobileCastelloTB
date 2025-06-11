import 'package:flutter/material.dart';
import 'package:sas_cfp/controllers/categorias_controller.dart';
import 'package:sas_cfp/controllers/transacao_controller.dart';
import 'package:sas_cfp/models/categorias_model.dart';
import 'package:sas_cfp/models/transacao_models.dart';
import 'package:sas_cfp/views/criar_categoria.dart';

class DetalheCategoriaScreen extends StatefulWidget {
  final int categoriaId;

  DetalheCategoriaScreen({
    super.key,
    required this.categoriaId,
  }); // Pega o Id pet

  @override
  State<StatefulWidget> createState() {
    return _DetalheCategoriaScreenState();
  }
}

class _DetalheCategoriaScreenState extends State<DetalheCategoriaScreen> {
  final _categoriasControl = CategoriasController();
  final _transacaoControl = TransacaoController();

  Categorias? _categorias;

  List<Categorias> _categoria = [];

  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarDados();
  }

  void _carregarDados() async {
    setState(() {
      _isLoading = true;
      _categoria = [];
    });
    try {
      _categoria = await _categoriasControl.readCategoriasbyId(widget.petId)
    }
  }
}
