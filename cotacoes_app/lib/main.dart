import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(CotacoesApp());
}

class CotacoesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Cotações',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, dynamic>> _futureRates;

  @override
  void initState() {
    super.initState();
    _futureRates = ApiService.fetchRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cotações em Tempo Real')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _futureRates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            final rates = snapshot.data!;
            final moedas = rates.keys.toList();

            return ListView.builder(
              itemCount: moedas.length,
              itemBuilder: (context, index) {
                String moeda = moedas[index];
                double valor = rates[moeda].toDouble();
                return ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text(moeda),
                  subtitle: Text('Valor: $valor'),
                  onTap: () {
                    // Navegação virá no Dia 3
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
