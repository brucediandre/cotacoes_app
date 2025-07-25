import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String moeda;
  final double valor;
  final Map<String, dynamic> rates;

  const DetailsPage({
    required this.moeda,
    required this.valor,
    required this.rates,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Moeda'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Moeda: $moeda',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Valor em dólar: \$${valor.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  if (moeda != 'BRL' && rates.containsKey('BRL'))
                    Text(
                      'Valor em reais: R\$ ${(valor * rates['BRL']).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else if (moeda == 'BRL')
                    const Text(
                      'Você já está visualizando o Real Brasileiro (BRL)',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
