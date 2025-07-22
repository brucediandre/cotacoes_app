import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String moeda;
  final double valor;

  const DetailsPage({required this.moeda, required this.valor, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes da Moeda')),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.monetization_on, size: 60, color: Colors.indigo),
                SizedBox(height: 16),
                Text('Moeda: $moeda', style: TextStyle(fontSize: 24)),
                SizedBox(height: 8),
                Text('Valor em USD: $valor', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
