import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final controlador;
  final rotulo;
  final dica;
  final icon;

  Editor({this.controlador, this.rotulo, this.dica, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            controller: controlador,
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
                icon: icon != null ? Icon(icon) : null,
                labelText: rotulo,
                hintText: dica),
            keyboardType: TextInputType.number,
          ),
          //ElevatedButton()
        ],
      ),
    );
  }
}