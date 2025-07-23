import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String moeda;
  final double valor;
  final Map<String, dynamic> rates;

  const DetailsPage({
    Key? key,
    required this.moeda,
    required this.valor,
    required this.rates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Informações extras das moedas (nome e símbolo)
    final Map<String, Map<String, String>> moedaInfo = {
      'USD': {'nome': 'Dólar Americano', 'simbolo': '\$'},
      'EUR': {'nome': 'Euro', 'simbolo': '€'},
      'BRL': {'nome': 'Real Brasileiro', 'simbolo': 'R\$'},
      'BTC': {'nome': 'Bitcoin', 'simbolo': '₿'},
      // você pode adicionar mais moedas aqui
    };

    final String nome = moedaInfo[moeda]?['nome'] ?? 'Moeda desconhecida';
    final String simbolo = moedaInfo[moeda]?['simbolo'] ?? '';

    // Lógica corrigida de conversão para BRL e USD
    double valorUSD = (moeda == 'USD') ? 1.0 : (1 / valor);
    double valorBRL = (moeda == 'BRL')
        ? valor
        : valorUSD * (rates['BRL'] ?? 0.0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Moeda'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.currency_exchange, size: 80, color: Colors.indigo),
                SizedBox(height: 20),
                Text(
                  nome,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Código: $moeda',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                SizedBox(height: 30),
                Text('1 $moeda equivale a:', style: TextStyle(fontSize: 18)),
                SizedBox(height: 12),
                Text(
                  'USD: ${valorUSD.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'BRL: ${valorBRL.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text('Símbolo: $simbolo', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
