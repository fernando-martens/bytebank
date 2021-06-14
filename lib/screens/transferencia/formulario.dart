import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando transferência"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controlador: _controladorCampoConta,
                rotulo: "Número da conta",
                dica: "0000",
              ),
              Editor(
                controlador: _controladorCampoValor,
                rotulo: "Valor",
                dica: "0.00",
                icon: Icons.monetization_on,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () => _criaTransferencia(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Confirmar"),
                  ),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                        fontSize: 25
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final numeroConta = int.tryParse(_controladorCampoConta.text);
    final valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
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
