import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'formulario.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          final tranferencia = widget._transferencias[index];
          return ItemTranferencia(tranferencia);
        },
      ),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
      ),
    );
  }
}
