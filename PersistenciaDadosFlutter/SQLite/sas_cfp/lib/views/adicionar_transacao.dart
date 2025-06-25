import 'package:flutter/material.dart';
import 'package:sas_cfp/controllers/transacao_controller.dart';
import 'package:sas_cfp/models/transacao_models.dart';

class AdicionarTransacaoScreen extends StatefulWidget {
  final int categoriaId;

  const AdicionarTransacaoScreen({super.key, required this.categoriaId});

  @override
  State<AdicionarTransacaoScreen> createState() => _AdicionarTransacaoScreenState();
}

class _AdicionarTransacaoScreenState extends State<AdicionarTransacaoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _valorController = TextEditingController();
  final _descricaoController = TextEditingController();

  String _tipoSelecionado = 'despesa';
  DateTime _dataSelecionada = DateTime.now();

  final _transacaoController = TransacaoController();

  Future<void> _salvarTransacao() async {
    if (_formKey.currentState!.validate()) {
      final novaTransacao = Transacao(
        valor: double.parse(_valorController.text.replaceAll(',', '.')),
        descricao: _descricaoController.text,
        dataHora: _dataSelecionada,
        tipo: _tipoSelecionado,
        categoriaId: widget.categoriaId,
      );

      await _transacaoController.createTransacao(novaTransacao);

      Navigator.pop(context); // volta pra tela anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar Transação")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _valorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Valor"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Informe o valor";
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: "Descrição"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Informe a descrição";
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _tipoSelecionado,
                items: const [
                  DropdownMenuItem(value: 'despesa', child: Text('Despesa')),
                  DropdownMenuItem(value: 'receita', child: Text('Receita')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _tipoSelecionado = value;
                    });
                  }
                },
                decoration: const InputDecoration(labelText: "Tipo"),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text("Data: ${_dataSelecionada.toLocal().toString().split(' ')[0]}"),
                  ),
                  TextButton(
                    child: const Text("Escolher Data"),
                    onPressed: () async {
                      final data = await showDatePicker(
                        context: context,
                        initialDate: _dataSelecionada,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (data != null) {
                        setState(() {
                          _dataSelecionada = data;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _salvarTransacao,
                child: const Text("Salvar Transação"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
