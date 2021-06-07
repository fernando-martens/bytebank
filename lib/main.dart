import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class ListaTranferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ItemTranferencia(Transferencia(100.00, 2000)),
        ],
      ),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class ItemTranferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTranferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int conta;

  Transferencia(this.valor, this.conta);
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando transferência"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controladorCampoConta,
                    style: TextStyle(fontSize: 24.0),
                    decoration: InputDecoration(
                        labelText: "Número da conta", hintText: "0000"),
                    keyboardType: TextInputType.number,
                  ),
                  //ElevatedButton()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controladorCampoValor,
                    style: TextStyle(fontSize: 24.0),
                    decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on),
                        labelText: "Valor", hintText: "0.00"),
                    keyboardType: TextInputType.number,
                  ),
                  //ElevatedButton()
                ],
              ),
            ),
            ElevatedButton(onPressed: () {
              debugPrint('clicou no confirmar');
              final numeroConta = int.tryParse(_controladorCampoConta.text);
              final valor = double.tryParse(_controladorCampoValor.text);
              if(numeroConta != null && valor != null){
                final transferenciaCriada = Transferencia(valor, numeroConta);
              }

            }, child: Text("Confirmar"))
          ],
        ));
  }
}
