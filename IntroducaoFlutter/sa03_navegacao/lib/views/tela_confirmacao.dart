import 'package:flutter/material.dart';

class TelaConfirmacao extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro Confirmado"),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green,),
            SizedBox(height: 20,),
            Text("Cadastro realizado com Sucesso!!", style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/"),
              child: Text("Voltar para o Início"))
          ],
        ),
      ),
    );
  }
}