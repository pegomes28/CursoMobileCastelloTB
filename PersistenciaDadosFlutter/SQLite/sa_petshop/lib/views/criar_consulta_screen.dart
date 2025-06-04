// socorro
// Criar serviõ para o pet

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sa_petshop/controllers/consulta_controller.dart';
import 'package:sa_petshop/models/consulta_model.dart';
import 'package:sa_petshop/views/detalhe_pet_screen.dart';

class CriarConsultaScreen extends StatefulWidget {
  final int petId; // Recebo o ID do Pet

  CriarConsultaScreen({super.key, required this.petId});

  @override
  State<StatefulWidget> createState() {
    return _CriarConsultaScreenState();
  }
}

class _CriarConsultaScreenState extends State<CriarConsultaScreen> {
  // Formulário
  final _formKey = GlobalKey<FormState>();
  final _consultasControl = ConsultaController();

  late String _tipoServico;
  late String _observacao;
  DateTime _selectedDate =
      DateTime.now(); // Não pode selecionar uma data anterior atual
  TimeOfDay _selectedTime =
      TimeOfDay.now(); //Não pode selecionar uma hora anterior atual

  // Método para Seleção da Data
  void _dataSelecionada(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Método para seleção de hora
  void _horaSelecionada(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  // Método para salvar a consulta
  void _salvarConsulta() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Salva os Valores do Formulário

      // Correção de Data
      final DateTime DataFinal = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      final newConsulta = Consulta(
        petId: widget.petId,
        dataHora: DataFinal,
        tipoServico: _tipoServico,
        observacao: _observacao.isEmpty ? "." : _observacao,
      );
      try {
        await _consultasControl.createConsulta(newConsulta);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Agendamento Feito com Sucesso")),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhePetScreen(petId: widget.petId),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Exception: $e")));
      }
    }
  }

  // Buildar a Tela
  @override
  Widget build(BuildContext context) {
    // Formatação para data e Hora
    final DateFormat dataFormatada = DateFormat("dd/MM/yyyy");
    final DateFormat horaFormatada = DateFormat("HH:MM");

    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Agendamento"),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Tipo de Serviço"),
              validator: (value) => value!.isEmpty ? "Campo deve Ser Preenchido" : null,
              onSaved: (newValue) => _tipoServico = newValue!,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: Text("Data: ${dataFormatada.format(_selectedDate)}")),
                TextButton(onPressed: ()=> _dataSelecionada(context), child: Text("Selecionar Data"))
              ],),
            Row(
              children: [
                Expanded(child: Text("Hora: ${horaFormatada.format(DateTime(0,0,0,_selectedTime.hour, _selectedTime.minute))}")),
                TextButton(onPressed: ()=> _horaSelecionada(context), child: Text("Selecionar Hora"))
              ],),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(labelText: "Observação"),
                maxLines: 3,
                onSaved: (newValue) => _observacao=newValue!,
              ),
              ElevatedButton(onPressed: _salvarConsulta, child: Text("Agendar Atendimento"))
          ],
        )),)
    );
  }
}
